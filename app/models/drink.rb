class Drink < ActiveRecord::Base
  has_many :reviews, class_name:  'DrinkReview', foreign_key: :drink_id, dependent: :destroy
  has_many :users_who_reviews, class_name: 'User', through: :reviews
  has_many :store_drinks
  has_many :stores, through: :store_drinks

  belongs_to :brewer, foreign_key: :brewer_id
  belongs_to :alcoholic, foreign_key: :alcoholic_id

  def self.search(params)
    if params
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      Drink.where(name: params.name)
        .where(alcohol: params.alcohol)
        .where(alcoholic: params.alcoholic)
        .where(brewer: params.brewer)
    else
      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
      Drink.all
    end
  end
end
