class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.string :phone
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
