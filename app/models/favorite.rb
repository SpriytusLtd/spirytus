class Favorite < ActiveRecord::Base

  has_and_belongs_to_many :stores
  has_and_belongs_to_many :users

end
