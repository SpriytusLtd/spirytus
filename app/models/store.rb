class Store < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :store_drinks
  has_many :drinks, through: :store_drinks

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 200 }
  validates :phone_number, presence: true, length: { maximum: 20 }
  validates :budget, presence: true, length: { maximum: 10 }
  validates :detail, presence: true, length: { maximum: 2000 }
end
