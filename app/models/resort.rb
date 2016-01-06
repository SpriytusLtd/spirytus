class Resort < ActiveRecord::Base
  has_and_belongs_to_many :store
end
