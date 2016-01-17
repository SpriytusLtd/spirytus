class Alcoholic < ActiveRecord::Base
  has_many :drink

  validates :name, presence: true, length: { maximum: 100 }
  validates :item1, presence: true, length: { maximum: 100 }
  validates :item2, presence: true, length: { maximum: 100 }
  validates :item3, length: { maximum: 100 }
  validates :item4, length: { maximum: 100 }
  validates :item5, length: { maximum: 100 }
  validates :item6, length: { maximum: 100 }
end
