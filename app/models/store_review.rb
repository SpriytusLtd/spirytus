class StoreReview < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :store_id
end
