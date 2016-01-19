class Drink < ActiveRecord::Base
  has_many :reviews, class_name:  'DrinkReview', foreign_key: :drink_id, dependent: :destroy
  has_many :users_who_reviews, class_name: 'User', through: :reviews
  has_many :store_drinks
  has_many :stores, through: :store_drinks

  belongs_to :brewer, foreign_key: :brewer_id
  belongs_to :alcoholic, foreign_key: :alcoholic_id

  validates :name, presence: true, length: { maximum: 100 }
  validates :alcohol, presence: true, length: { maximum: 100 }
  validates :detail, presence: true, length: { maximum: 1000 }

  def self.search(name, alcohol, alcoholic, brewer)
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      print(name)
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      print(alcohol)
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      print(alcoholic)
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      print(brewer)
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
if name || alcohol || alcoholic || brewer
            Drink.where("name = name")
        .where("alcohol = alochol")
        .where("alcoholic = alcoholic")
        .where("brewer = brewer")
    else
      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
      print("ヒットしませんでした")
      Drink.all
    end
  end
end
