class DrinkReview < ActiveRecord::Base
   belongs_to :users, foreign_key: :users_id
   belongs_to :drinks, foreign_key: :drinks_id
end
