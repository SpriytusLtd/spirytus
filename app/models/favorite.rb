class Favorite < ActiveRecord::Base
  has_and_belongs_to_many :store
  has_and_belongs_to_many :user
end
