class LocatorsController < ApplicationController   
  def search
    @remote_ip = remote_ip()
    @result = Geocoder.search(@remote_ip)
    @city = @result.first.data["city"]
  end

  def index
    if params[:locators]["name"].empty?
      @locators = Locator.where(city:params[:city]) 
    else
      @locators = Locator.where(city:params[:city], name:params[:locators]["name"])
    end
  end
end
