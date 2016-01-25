class CreateStoreReviews < ActiveRecord::Migration
  def change
    create_table :store_reviews do |t|
      t.integer :user_id, null: false
      t.integer :store_id, null: false
      t.text :body

      t.timestamps null: false
    end
  end
end
