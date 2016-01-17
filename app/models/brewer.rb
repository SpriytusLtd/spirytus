class Brewer < ActiveRecord::Base
  has_many :drink

  validates :name, presence: true, length: { maximum: 100 }
end
