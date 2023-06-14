class CreateAttributions < ActiveRecord::Migration[7.0]
  def change
    create_table :attributions do |t|
      t.string :phone
      t.string :name
      t.string :company
      t.string :facebook
      t.string :address
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
