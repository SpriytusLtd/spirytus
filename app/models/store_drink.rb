class StoreDrink < ActiveRecord::Base
  belongs_to :store
  belongs_to :drink
end
