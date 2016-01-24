class CreateStoresDishes < ActiveRecord::Migration
  def change
    create_table :stores_dishes, id: false do |t|
      t.references :store, index: true, null: false
      t.references :dishes, index: true, null: false
    end
  end
end
