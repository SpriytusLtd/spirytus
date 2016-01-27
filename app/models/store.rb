class Store < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, class_name:  'StoreReview', foreign_key: :store_id, dependent: :destroy
  has_many :users_who_reviews, class_name: 'User', through: :reviews
  has_many :store_drinks, class_name: 'StoreDrink', foreign_key: :store_id, dependent: :destroy
  has_many :have_drinks, class_name: 'Drink', through: :store_drinks
  has_many :store_dishes, class_name: 'StoreDish', foreign_key: :store_id, dependent: :destroy
  has_many :have_dishes, class_name: 'Dish', through: :store_dishes
  has_many :resort_stores, class_name: 'ResortStore', foreign_key: :store_id, dependent: :destroy
  has_many :close_resorts, class_name: 'Resort', through: :resort_stores

  belongs_to :municipality, foreign_key: :municipality_id

  has_and_belongs_to_many :users_who_likes, class_name: 'User'

  belongs_to :store_content, foreign_key: :store_content_id
  has_many :contents, class_name: 'StoreContent'

  validates :name, presence: true, length: { maximum: 100 }
  validates :municipality_id, presence: true
  validates :address, presence: true, length: { maximum: 200 }
  validates :phone_number, presence: true, length: { maximum: 20 }
  validates :budget, length: { maximum: 10 }
  validates :detail, presence: true, length: { maximum: 2000 }

  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :store_drinks, allow_destroy: true
  accepts_nested_attributes_for :store_dishes, allow_destroy: true
  accepts_nested_attributes_for :resort_stores, allow_destroy: true

  def self.search(info)
    @stores = Store.all
    @stores = name_search(@stores, info[:name]) if info[:name].present?
    @stores = resort_search(@stores, info[:resort]) if info[:resort].present?
    @stores = drink_search(@stores, info[:drink]) if info[:drink].present?
    @stores = dish_search(@stores, info[:dish]) if info[:dish].present?
    @stores = people_search(@stores, info[:people]) if info[:people].present?
    @stores = budget_search(@stores, info[:budget]) if info[:budget].present?
    @stores
  end

  private

  def self.name_search(date, name)
    @result = date.where('name like ?', "%#{name}%")
  end

  def self.resort_search(date, resort)
    @result = date.where(id: ResortStore.search(nil, resort))
  end

  def self.drink_search(date, drink)
    @result = date.where(id: StoreDrink.search(nil, drink))
  end

  def self.dish_search(date, dish)
    @result = date.where(id: StoreDish.search(nil, dish))
  end

  def self.peiople_search(date, people)
    @result = date.where('banquet_hall_capacity >= ?', people)
  end

  def self.budget_search(date, budget)
    if budget.to_i <= 5000
      @result = date.where('budget <= ?', budget)
    else
      @result = date.where('budget > ?', budget)
    end
    @result
  end
end
