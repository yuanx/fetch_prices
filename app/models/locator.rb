class Locator < ActiveRecord::Base
  geocoded_by :address
  
  def find_city
    Locator.select("DISTINCT(city)").where(state:self.state)
  end
  
  def address
    self.street+' '+self.city+' '+self.state
  end
end
