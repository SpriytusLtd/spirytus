class Resort < ActiveRecord::Base
  has_and_belongs_to_many :store

  validates :name, presence: true, length: { maximum: 100 }
  validates :address, length: { maximum: 200 }
  validates :detail, presence: true, length: { maximum: 1000 }
end
