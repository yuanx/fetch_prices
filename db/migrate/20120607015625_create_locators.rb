class CreateLocators < ActiveRecord::Migration
  def change
    create_table :locators do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :name
      t.text :hours
      t.string :phone

      t.timestamps
    end
  end
end
