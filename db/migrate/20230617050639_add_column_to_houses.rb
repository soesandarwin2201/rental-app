class AddColumnToHouses < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :adverstise, :boolean
  end
end
