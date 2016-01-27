class Dish < ActiveRecord::Base
  has_many :store_dishes, class_name: 'StoreDish', foreign_key: :dish_id, dependent: :destroy
  has_many :belong_stores, class_name: 'Store', through: :store_dishes

  validates :name, presence: true, length: { maximum: 100 }
  validates :detail, length: { maximum: 1000 }

  mount_uploader :image, ImageUploader
end
