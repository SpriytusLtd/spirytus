class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :dishes

  validates :name, presence: true, length: { maximum: 100 }
end
