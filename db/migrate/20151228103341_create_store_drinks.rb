class CreateStoreDrinks < ActiveRecord::Migration
  def change
    create_table :store_drinks do |t|
      t.integer :store_id, null: false
      t.integer :drink_id, nill: false

      t.timestamps null: false
    end
  end
end
