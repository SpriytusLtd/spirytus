class Drink < ActiveRecord::Base
  has_many :reviews, class_name:  'DrinkReview', foreign_key: :drink_id, dependent: :destroy
  has_many :users_who_reviews, class_name: 'User', through: :reviews
  has_many :store_drinks
  has_many :stores, through: :store_drinks

  belongs_to :brewer, foreign_key: :brewer_id
  belongs_to :alcoholic, foreign_key: :alcoholic_id

  validates :name, presence: true, length: { maximum: 100 }
  validates :alcohol, presence: true, length: { maximum: 100 }
  validates :detail, presence: true, length: { maximum: 1000 }

  def self.search(name, alcohol, alcoholic_id, brewer_id)
    @drinks = Drink.all
    @drinks = @drinks.where(name: name) if name.present?
    @drinks = @drinks.where(alcohol: alcohol) if alcohol.present?
    @drinks = @drinks.where(alcoholic_id: alcoholic_id) if alcoholic_id.present?
    @drinks = @drinks.where(brewer_id: brewer_id) if brewer_id.present?
    @drinks
  end
end
