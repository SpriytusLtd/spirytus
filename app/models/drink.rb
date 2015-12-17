class Drink < ActiveRecord::Base

  has_many :reviews, class_name: "DrinkReview", foreign_key: :drink_id, dependent: :destroy
  has_many :users_who_reviews, class_name: "User", through: :reviews

  belongs_to :brewers, foreign_key: :brewer_id
  belongs_to :alcoholics, foreign_key: :alcoholic_id

  has_and_belongs_to_many :users_who_likes, class_name: "User"
  has_and_belongs_to_many :stores
end
