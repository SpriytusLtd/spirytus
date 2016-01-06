class Dish < ActiveRecord::Base
  has_and_belongs_to_many :stores
  has_and_belongs_to_many :ingredients
end
