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
    catch_date
    name_search(@stores, info[:name]) if info[:name].present?
    resort_drink_dish_search(@stores, info[:resort], info[:drink], info[:dish])
    people_search(@stores, info[:people]) if info[:people].present?
    budget_search(@stores, info[:budget]) if info[:budget].present?
    @stores
  end

  def self.catch_date
    @stores = Store.all
  end

  def self.name_search(date, name)
    @stores = date.where('name like ?', "%#{name}%")
  end

  def self.resort_drink_dish_search(date, resort, drink, dish)
    @stores = date.where(id: ResortStore.search(nil, resort)) if resort.present?
    @stores = date.where(id: StoreDrink.search(nil, drink)) if drink.present?
    @stores = date.where(id: StoreDish.search(nil, dish)) if dish.present?
  end

  def self.people_search(date, people)
    @stores = date.where('banquet_hall_capacity >= ?', people)
  end

  def self.budget_search(date, budget)
    if budget.to_i <= 5000
      @stores = date.where('budget <= ?', budget)
    else
      @stores = date.where('budget > ?', budget)
    end
    @stores
  end
end
