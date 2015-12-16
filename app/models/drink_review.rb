class DrinkReview < ActiveRecord::Base
  belongs_to :users, foreign_key: :user_id
  belongs_to :drinks, foreign_key: :drink_id
end
