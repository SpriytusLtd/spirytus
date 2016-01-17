class StoreReview < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :store, foreign_key: :store_id

  validates :user_id, presence: true
  validates :store_id, presence: true
  validates :body, length: { maximum: 1000 }
end
