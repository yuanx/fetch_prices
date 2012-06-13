class LocatorsController < ApplicationController   
  
  def search
    @remote_ip = remote_ip()
    @result = Geocoder.search(@remote_ip)
    @city = @result.first.data["city"]
  end
  
  def advanced
  end

  def search_result
    if request.referer.include? "search_store"
      if params[:locators]["name"].empty?
        @locators = Locator.where(city:params[:locators]["city"]) 
      else
        @locators = Locator.where(city:params[:locators]["city"], name:params[:locators]["name"])
      end
    elsif request.referer.include? "advanced_search"
      @locators = Locator.where(city:params[:locators]['city'], state:params[:locators]['state'])
    end
  end
  
  def asearch_result
    @lo = Geocoder.search(params[:zipcode])
    @locators = Locator.near(@lo[0].address, params[:range],:order=>:distance)
  end
  
  
  
end
