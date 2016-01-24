class Municipality < ActiveRecord::Base
  has_many :store

  validates :name, presence: true, length: { maximum: 100 }
end
