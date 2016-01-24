FactoryGirl.define do
  factory :store1, class: Store do
    email 'store1@email.com'
    password 'store1pass'
    name 'store1'
    municipality_id 1
    address 'kut-1-1-1'
    phone_number '090-1111-1111'
    budget 901
    detail 'yeah1!!'
  end
  factory :store2, class: Store do
    email 'store2@email.com'
    password 'store2pass'
    name 'store2'
    municipality_id 1
    address 'kut-1-1-2'
    phone_number '090-1111-1112'
    budget 902
    detail 'yeah2!!'
  end
end
