class CreateStoresResorts < ActiveRecord::Migration
  def change
    create_table :stores_resorts, id: false do |t|
      t.references :store, index: true, null: false
      t.references :resort, index: true, null: false
    end
  end
end
