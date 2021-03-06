class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :store_reviews, class_name: StoreReview, foreign_key: :user_id, dependent: :destroy
  has_many :drink_reviews, class_name: DrinkReview, foreign_key: :user_id, dependent: :destroy

  has_and_belongs_to_many :favorite_stores, class_name: 'Store'
  has_and_belongs_to_many :favorite_drinks, class_name: 'Drink'

  validates :name, presence: true, length: { maximum: 20 }

  # User.thumbnail.url is url of user thumbnail image
  mount_uploader :thumbnail, ImageUploader
end
