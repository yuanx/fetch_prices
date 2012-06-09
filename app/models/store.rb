class Store
    
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def self.attr_accessor(*vars)
    @attributes ||= []
    @attributes.concat( vars )
    super
  end

   def self.attributes
     @attributes
   end

   def initialize(attributes={})
     attributes && attributes.each do |name, value|
       send("#{name}=", value) if respond_to? name.to_sym 
     end
   end

  def persisted?
    false
  end

  def self.inspect
    "#<#{ self.to_s} #{ self.attributes.collect{ |e| ":#{ e }" }.join(', ') }>"
  end
  
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => "is invalid"
  validates_presence_of :email,  :message => "can't be blank"
  
  attr_reader :search
  attr_accessor :total_number, :name_price_picture, :email
  
  def fetch_price(keywords)
    require 'nokogiri'
    require 'open-uri'
    
    @name = []
    @price = []
    @picture = []
    @link =[]
    @sale_price=[]
    @from =[]
    
    #Fetch data from Bloomingdale
    url = "http://www1.bloomingdales.com/search/results.ognc?Action=sk&pageid=1&startpos=1&Keyword="+keywords.gsub(' ','+')+"&cKey=1&sortOption=*&resultsPerPage=500"
    uri = URI.parse(url)
    r = Net::HTTP.get_response(uri)
    if r.code =="301"
      doc = Nokogiri::HTML(open("http://www1.bloomingdales.com"))
    else
      doc = Nokogiri::HTML(open(url))      
    end
    doc.css(".se_result_image").each do |item|
      unless item.at_css(".priceSale .priceSale").nil?
        @sale_price << item.at_css(".priceSale .priceSale").text[/[\$\.\,\-0-9]+/]
        unless item.at_css(".shortDescription").nil? 
          @name << item.at_css(".shortDescription").text
        else 
          @name << "N/A"
        end
      
        unless item.at_css(".priceBig").nil? 
          @price << item.at_css(".priceBig").text 
        else 
          @price << "N/A"
        end
        
        @picture << item.at_css("a").children.first.attributes["src"].value
        @link << "http://www1.bloomingdales.com"+ item.at_css("a").first[1]        
        @from << "Bloomingdale.gif"        
      end      
    end
    
    #Fetch data from Saks.com
    url_saks = "http://www.saksfifthavenue.com/search/EndecaSearch.jsp?bmForm=endeca_search_form_one&bmFormID=jpXmdRd&bmUID=jpXmdRe&bmIsForm=true&bmPrevTemplate=%2FEntry.jsp&bmText=SearchString&SearchString="+keywords.gsub(' ','+')+"&bmSingle=N_Dim&N_Dim=1553&bmImage=EndecaSearchButton.x&bmImage=EndecaSearchButton.y&bmImage=EndecaSearchButton&EndecaSearchButton.x=12&EndecaSearchButton.y=8&bmHidden=Ntt&Ntt="+keywords.gsub(' ','+')+"&bmHidden=Ns&Ns=&bmHidden=N&N=1553&bmHidden=Ntk&Ntk=Entire+Site&bmHidden=Ntx&Ntx=mode%2Bmatchpartialmax&bmHidden=prp8&prp8=t15&bmHidden=prp13&prp13=&bmHidden=sid&sid=1367B8D448B1"
    doc = Nokogiri::HTML(open(url_saks))
    doc.css("div").each do |item|
      unless (item.attributes["id"].nil? || item.attributes["id"].value.match(/product-([0-9]+)/).nil?)
        @picture << item.at_css(".image-container-large").at_css(".pa-product-large").attributes["src"].value
        @link << item.at_css(".image-container-large").children[5].attributes["href"].value
        @from << "Saks.jpg"
        
        @name << item.at_css(".product-designer-name").text+" "+item.at_css(".product-description").text
        @price << item.at_css(".product-price").text[/[\$\.\,\-0-9]+/]
        @sale_price << item.at_css(".product-sale-price").text
      end        
    end
    
    #Fetch data from NeimanMarcus
    url_NM = "http://www.neimanmarcus.com/search.jsp?No=0&Ntt="+keywords.gsub(' ','+')+"&_requestid=58494&N=0&st=s&pageSize=500"
    doc = Nokogiri::HTML(open(url_NM))
    
    #redo the site crwal on 06-08-2012
    unless doc.css(".product").empty?
      doc.css(".product").each do |item| 
        @name << ((item.at_css('.hasdesigner').nil? || item.at_css('.productdesigner').nil?) ? "N/A" : "#{item.at_css('.productdesigner').text[/[A-Za-z ]+/]} #{item.at_css('.hasdesigner').text[/[A-Za-z ]+/]}")
        
        # Origin Price
        @price << (item.css(".allpricing .priceadorn").nil? ? "N/A" : item.at_css(".priceadorn").text[/[\$\.\,\-0-9]+/])
        
        # Sales Price        
        @sale_price << (item.at_css('.allpricing').children[3].nil? ? "N/A" : item.at_css('.allpricing').children[3].text[/[\$\.\,\-0-9]+/])
        
        @link << "http://www.neimanmarcus.com" + item.at_css(".prodImgLink").attributes["href"].value
        @picture << item.at_css(".prodImgLink .productImage").attributes["src"].value
        @from << "NeimanMarcus.jpg"
      end
    end  
    
    @picture = @picture.zip(@link)    
    @name_price_picture = @name.zip(@price, @sale_price, @from, @picture)    
    @total_number = @name_price_picture.length
    
  end  
  
  
end

