class ChangeColumnToStoreReview < ActiveRecord::Migration
  def up
    change_column :store_reviews, :user_id, :integer, null: false, default: 0
    change_column :store_reviews, :store_id, :integer, null: false, default: 0
    change_column :store_reviews, :body, :text, limit: 1000
  end
  def down
    change_column :store_reviews, :user_id, :integer, null: false
    change_column :store_reviews, :store_id, :integer, null: false
    change_column :store_reviews, :body, :text
  end
end
