class CreateResortStores < ActiveRecord::Migration
  def change
    create_table :resort_stores do |t|
      t.integer :resort_id, null: false
      t.integer :store_id, null: false

      t.timestamps null: false
    end
  end
end
