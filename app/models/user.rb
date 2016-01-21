class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :store_reviews, class_name: StoreReview, foreign_key: :user_id, dependent: :destroy

  has_and_belongs_to_many :favorite_stores, class_name: 'Store'

  validates :name, presence: true, length: { maximum: 20 }
end
