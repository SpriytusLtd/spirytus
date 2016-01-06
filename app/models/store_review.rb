class StoreReview < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :store, foreign_key: :store_id
end
