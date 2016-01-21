class Store < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, class_name:  'StoreReview', foreign_key: :store_id, dependent: :destroy
  has_many :users_who_reviews, class_name: 'User', through: :reviews

  belongs_to :brewer, foreign_key: :brewer_id
  belongs_to :alcoholic, foreign_key: :alcoholic_id

  has_and_belongs_to_many :users_who_likes, class_name: 'User'
  has_and_belongs_to_many :drinks

  validates :name, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 200 }
  validates :phone_number, presence: true, length: { maximum: 20 }
  validates :budget, length: { maximum: 10 }
  validates :detail, presence: true, length: { maximum: 2000 }

  mount_uploader :image, ImageUploader
end
