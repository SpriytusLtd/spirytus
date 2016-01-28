class CreateStoreDishes < ActiveRecord::Migration
  def change
    create_table :store_dishes do |t|
      t.integer :store_id, null: false
      t.integer :dish_id, nill: false

      t.timestamps null: false
    end
  end
end
