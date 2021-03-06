class ChangeColumnToDrinkReviews < ActiveRecord::Migration
  def up
    change_column :drink_reviews, :body, :text, null: false, limit: 1000
    change_column :drink_reviews, :param1, :integer, null: false, default: 0
    change_column :drink_reviews, :param2, :integer, null: false, default: 0
  end
  def down
    change_column :drink_reviews, :body, :text, null: false
    change_column :drink_reviews, :param1, :integer, null: false
    change_column :drink_reviews, :param2, :integer, null: false
  end
end
