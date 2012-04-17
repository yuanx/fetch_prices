class StoreController < ApplicationController  
  def index
    if params[:search].present? 
      @result = Store.new()
      @keyword = params[:search]
      @result.fetch_price(params[:search])
      # params[:search]=''
      
      params[:sort] ||= "name"
      params[:direction] ||= "asc"
      
      if params[:direction]=="desc"
        order = -1
      else
        order = 1
      end
        
      
      if params[:sort] == "name"
        @result.name_price_picture = order==1 ? (@result.name_price_picture.sort_by{|a| a[0]}) : (@result.name_price_picture.sort_by{|a| a[0]}.reverse)
      elsif params[:sort] == "price"
        @result.name_price_picture = @result.name_price_picture.sort_by{|a| get_value(a[1])*order}
      elsif params[:sort]=="saleprice"
        @result.name_price_picture = @result.name_price_picture.sort_by{|a| (a[2].nil? ? 0xffff : get_value(a[2]))*order}
      elsif params[:sort]=="from"
        @result.name_price_picture = order==1 ? (@result.name_price_picture.sort_by{|a| a[3]}) : (@result.name_price_picture.sort_by{|a| a[3]}.reverse)
      else
        @result.name_price_picture = @result.name_price_picture.sort_by{|a| a[0]*order}
      end
      @page = Kaminari.paginate_array(@result.name_price_picture).page(params[:page]).per(10)
    end
    
    respond_to do |format|
      format.html {session[:place]=[params[:ItemName], params[:OldPrice],params[:NewPrice],params[:ItemLink]]}
    end
  end
  
  def sendmail
    if Store.new(:email => params[:email]).valid?
      @info = session[:place]
      @reciver = params[:email]
      ReminderMailer.reminder(@reciver, @info).deliver
      flash[:notice] ="Reminder has been sent to your email!"
      redirect_to session[:return_to]
    else
      render 
    end
  end
  
  def get_value(str)
    unless str.index('-').nil?
      number = str[0...str.index('-')].delete('\$\,').to_f
    else
      number = str.delete('\$\,').to_f
    end
  end

end
