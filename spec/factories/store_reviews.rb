FactoryGirl.define do
  factory :store_review1_1, class: StoreReview do
    user_id 1
    store_id 1
    body 'store review 1 - 1'
  end
  factory :store_review1_2, class: StoreReview do
    user_id 1
    store_id 2
    body 'store review 1 - 2'
  end
  factory :store_review2_1, class: StoreReview do
    user_id 2
    store_id 1
    body 'store review 2 - 1'
  end
  factory :store_review2_2, class: StoreReview do
    user_id 2
    store_id 2
    body 'store review 2 - 2'
  end
end
