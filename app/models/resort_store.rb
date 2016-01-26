class ResortStore < ActiveRecord::Base
  belongs_to :resort, foreign_key: :resort_id
  belongs_to :store, foreign_key: :store_id

  validates :resort_id, presence: true
  validates :store_id, presence: true

  def self.search(store_id, resort_id)
    @resort_stores = ResortStore.all
    @resort_stores = @resort_stores.where(resort_id: resort_id) if resort_id.present?
    @resort_stores = @resort_stores.where(store_id: store_id) if store_id.present?
    @resort_stores
  end
end
