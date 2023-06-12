class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :country
      t.string :house_status
      t.string :house_type
      t.float :latitude
      t.float :longitude
      t.float :price
      t.date :update_date
      t.string :detail
      t.string :square

      t.timestamps
    end
  end
end
