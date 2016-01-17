class Dish < ActiveRecord::Base
  has_and_belongs_to_many :stores
  has_and_belongs_to_many :ingredients

  validatable :name, presence: true, length: { maximum: 100 }
  validatable :local_dishes, presence: true
  validatable :dishes, length: { maximum: 1000 }
end
