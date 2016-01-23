FactoryGirl.define do
  factory :drink_review1_1, class: DrinkReview do
    user_id 1
    drink_id 1
    body 'drink review 1 - 1'
    param1 1
    param2 2
    param3 3
    param4 4
    param5 5
    param6 6
  end
  factory :drink_review1_2, class: DrinkReview do
    user_id 1
    drink_id 2
    body 'drink review 1 - 2'
    param1 1
    param2 2
    param3 3
    param4 4
    param5 5
    param6 6
  end
  factory :drink_review2_1, class: DrinkReview do
    user_id 2
    drink_id 1
    body 'drink review 2 - 1'
    param1 1
    param2 2
    param3 3
    param4 4
    param5 5
    param6 6
  end
  factory :drink_review2_2, class: DrinkReview do
    user_id 2
    drink_id 2
    body 'drink review 2 - 2'
    param1 1
    param2 2
    param3 3
    param4 4
    param5 5
    param6 6
  end
end
