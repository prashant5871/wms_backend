class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :location_type, null: false # e.g., 'warehouse', 'zone', 'bin'
      
      t.references :parent, foreign_key: { to_table: :locations }, null: true

      t.timestamps
    end
  end
end
