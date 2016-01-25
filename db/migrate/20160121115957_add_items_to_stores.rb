class AddItemsToStores < ActiveRecord::Migration
  def change
    add_column :stores, :business_day, :string
    add_column :stores, :business_time, :string
    add_column :stores, :transportation, :text
    add_column :stores, :seat, :integer, default: 0
    add_column :stores, :room, :integer, default: 0
    add_column :stores, :banquet_hall, :boolean, default: false
    add_column :stores, :banquet_hall_capacity, :integer, default: 0
    add_column :stores, :smoking, :integer, default: 0
    add_column :stores, :hp, :string
    add_column :stores, :store_content_id, :integer
  end
end
