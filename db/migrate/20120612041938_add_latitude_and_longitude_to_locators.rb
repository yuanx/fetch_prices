class AddLatitudeAndLongitudeToLocators < ActiveRecord::Migration
  def change
    add_column :locators, :latitude, :float
    add_column :locators, :longitude, :float
  end
end
