class DropTableStoresDrinks < ActiveRecord::Migration
  def change
    drop_table :stores_drinks
  end
end
