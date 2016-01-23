class Dish < ActiveRecord::Base
  has_and_belongs_to_many :stores, class_name: 'Store'

  validates :name, presence: true, length: { maximum: 100 }
  validates :detail, length: { maximum: 1000 }
end
