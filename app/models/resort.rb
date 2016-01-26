class Resort < ActiveRecord::Base
  has_many :resort_stores, class_name: 'ResortStore', foreign_key: :resort_id, dependent: :destroy
  has_many :close_stores, class_name: 'Store', through: :resort_stores

  validates :name, presence: true, length: { maximum: 100 }
  validates :address, length: { maximum: 200 }
  validates :detail, presence: true, length: { maximum: 1000 }

  mount_uploader :image, ImageUploader
end
