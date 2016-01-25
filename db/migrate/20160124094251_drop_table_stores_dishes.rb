class DropTableStoresDishes < ActiveRecord::Migration
  def change
    drop_table :stores_dishes
  end
end
