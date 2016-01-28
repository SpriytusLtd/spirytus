class StoreDish < ActiveRecord::Base
  belongs_to :store, foreign_key: :store_id
  belongs_to :dish, foreign_key: :dish_id

  validates :store_id, presence: true
  validates :dish_id, presence: true

  def self.search(store_id, dish_id)
    @store_dishes = StoreDish.all
    @store_dishes = @store_dishes.where(store_id: store_id) if store_id.present?
    @store_dishes = @store_dishes.where(dish_id: dish_id) if dish_id.present?
    @store_dishes
  end
end
