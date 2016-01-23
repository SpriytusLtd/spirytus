class CreateStoresDrinks < ActiveRecord::Migration
  def change
    create_table :stores_drinks, id: false do |t|
      t.references :store, index: true, null: false
      t.references :drink, index: true, null: false
    end
  end
end
