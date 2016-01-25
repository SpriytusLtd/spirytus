class ChangeColumnToId < ActiveRecord::Migration
  def up
    change_column :drinks, :user_id, :integer, limit: 4, null: false
    change_column :drinks, :drink_id, :integer, limit: 4, null: false
    change_column :store_reviews, :user_id, :integer, limit: 4, null: false
    change_column :store_reviews, :store_id, :integer, limit: 4, null: false
    change_column :stores, :municipality_id, :integer, limit: 4, null: false
  end
  def down
    change_column :drinks, :user_id, :integer, limit: 4, default: 0,  null: false
    change_column :drinks, :drink_id, :integer, limit: 4, default: 0, null: false
    change_column :store_reviews, :user_id, :integer, limit: 4, default: 0,  null: false
    change_column :store_reviews, :store_id, :integer, limit: 4, default: 0,  null: false
    change_column :stores, :municipality_id, :integer, limit: 4, default: 0, null: false
  end
end
