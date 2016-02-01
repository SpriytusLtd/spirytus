class Drink < ActiveRecord::Base
  has_many :reviews, class_name:  'DrinkReview', foreign_key: :drink_id, dependent: :destroy
  has_many :users_who_reviews, class_name: 'User', through: :reviews
  has_many :store_drinks, class_name: 'StoreDrink', foreign_key: :drink_id, dependent: :destroy
  has_many :belong_stores, class_name: 'Store', through: :store_drinks, source: :store

  belongs_to :brewer, foreign_key: :brewer_id
  belongs_to :alcoholic, foreign_key: :alcoholic_id

  has_and_belongs_to_many :users_who_likes, class_name: 'User'

  validates :name, presence: true, length: { maximum: 100 }
  validates :alcohol, length: { maximum: 3 }
  validates :detail, length: { maximum: 1000 }

  def self.search(name, alcohol, alcoholic_id, brewer_id)
    range = [[0, 4], [5, 9], [10, 19], [20, 39], [40, 100]]
    @drinks = Drink.all
    @drinks = @drinks.where('name like ?', "%#{name}%") if name.present?
    @drinks = @drinks.where(alcohol: range[alcohol.to_i][0]..range[alcohol.to_i][1]) if alcohol.present?
    @drinks = @drinks.where(alcoholic_id: alcoholic_id) if alcoholic_id.present?
    @drinks = @drinks.where(brewer_id: brewer_id) if brewer_id.present?
    @drinks
  end
end
