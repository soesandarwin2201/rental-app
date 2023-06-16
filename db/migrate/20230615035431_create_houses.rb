class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :bathroom
      t.integer :bedroom
      t.string :country
      t.string :home_status
      t.string :home_type
      t.decimal :longitude
      t.decimal :latitude
      t.float :price
      t.date :update_date
      t.string :desc
      t.string :square
      t.string :city
      t.string :zipcode
      t.string :street
      t.string :zone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
