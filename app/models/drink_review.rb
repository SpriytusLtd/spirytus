class DrinkReview < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :drink, foreign_key: :drink_id

  validates :body, presence: true, length: { maximum: 1000 }
  validates :param1, presence: true
  validates :param2, presence: true
end
