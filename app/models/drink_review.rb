class DrinkReview < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :drink, foreign_key: :drink_id
end
