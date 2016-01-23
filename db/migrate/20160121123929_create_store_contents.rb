class CreateStoreContents < ActiveRecord::Migration
  def change
    create_table :store_contents do |t|
      t.references :store, index: true, foreign_key: true
      t.string :image
      t.text :description
      t.boolean :top, default: true

      t.timestamps null: false
    end
  end
end
