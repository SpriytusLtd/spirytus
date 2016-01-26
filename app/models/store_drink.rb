class StoreDrink < ActiveRecord::Base
  belongs_to :store, foreign_key: :store_id
  belongs_to :drink, foreign_key: :drink_id

  validates :store_id, presence: true
  validates :drink_id, presence: true

  def self.search(store_id, drink_id)
    @store_drinks = StoreDrink.all
    @store_drinks = @store_drinks.where(store_id: store_id) if store_id.present?
    @store_drinks = @store_drinks.where(drink_id: drink_id) if drink_id.present?
    @store_drinks
  end
end
