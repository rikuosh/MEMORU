class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.string :store
      t.integer :genre_id
      t.text :information
      t.string :size
      t.date :purchase_date
      t.date :warranty_period

      t.timestamps
    end
  end
end
