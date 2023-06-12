class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :address
      t.string :details

      t.timestamps
    end
  end
end
