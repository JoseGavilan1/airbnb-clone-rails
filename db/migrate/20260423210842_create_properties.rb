class CreateProperties < ActiveRecord::Migration[8.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.integer :bedrooms

      t.timestamps
    end
  end
end
