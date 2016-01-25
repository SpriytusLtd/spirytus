class CreateDrinksStores < ActiveRecord::Migration
  def change
    create_table :drinks_stores, id: false do |t|
      t.references :drink, index: true, null: false
      t.references :store, index: true, null: false
    end
  end
end
