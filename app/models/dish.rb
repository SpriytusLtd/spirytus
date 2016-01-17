class Dish < ActiveRecord::Base
  has_and_belongs_to_many :stores
  has_and_belongs_to_many :ingredients

  validates :name, presence: true, length: { maximum: 100 }
  validates :local_dishes, presence: true
  validates :dishes, length: { maximum: 1000 }
end
