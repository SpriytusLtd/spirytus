class Drink < ActiveRecord::Base

  has_many :drink_reviews, dependent: :destroy

  belongs_to :brewers, foreign_key: :brewer_id
  belongs_to :alcoholics, foreign_key: :alcoholic_id
  
  has_and_belongs_to_many :users
  has_and_belongs_to_many :stores

end
