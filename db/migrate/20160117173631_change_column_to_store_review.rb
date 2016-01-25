class ChangeColumnToStoreReview < ActiveRecord::Migration
  def up
    change_column :store_reviews, :body, :text, limit: 1000
  end
  def down
    change_column :store_reviews, :body, :text
  end
end
