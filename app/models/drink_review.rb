class DrinkReview < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :drink, foreign_key: :drink_id

  validates :user_id, presence: true
  validates :drink_id, presence: true
  validates :body, presence: true, length: { maximum: 1000 }
  validates :param1, presence: true
  validates :param2, presence: true

  def self.search(user_id, drink_id)
    @drink_reviews = DrinkReview.all
    @drink_reviews = @drink_reviews.where(user_id: user_id) if user_id.present?
    @drink_reviews = @drink_reviews.where(drink_id: drink_id) if drink_id.present?
    @drink_reviews
  end
end
