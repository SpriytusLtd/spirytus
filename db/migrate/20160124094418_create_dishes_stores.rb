class CreateDishesStores < ActiveRecord::Migration
  def change
    create_table :dishes_stores, id: false do |t|
      t.references :dish, index: true, null: false
      t.references :store, index: true, null: false
    end
  end
end
