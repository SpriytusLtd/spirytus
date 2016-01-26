FactoryGirl.define do
  factory :resort1, class: Resort do
    name 'resort1'
    address 'resort1-address'
    detail '詳細'
  end
end

FactoryGirl.define do
  factory :resort2, class: Resort do
    name 'resort2'
    address 'resort2-address'
    detail '詳細'
  end
end
