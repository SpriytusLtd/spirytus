class StoreReview < ActiveRecord::Base
  belongs_to :users, foreign_key: :user_id
  belongs_to :stores, foreign_key: :store_id
end
