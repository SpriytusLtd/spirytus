class CreateDrinkReviews < ActiveRecord::Migration
  def change
    create_table :drink_reviews do |t|
      t.integer :user_id, null: false
      t.integer :drink_id, null: false
      t.text :body, null: false
      t.integer :param1, null: false
      t.integer :param2, null: false
      t.integer :param3, null: true
      t.integer :param4, null: true
      t.integer :param5, null: true
      t.integer :param6, null: true

      t.timestamps null: false
    end
  end
end
