FactoryGirl.define do
  factory :user1, class: User do
    name 'user1'
    email 'user1@email.com'
    password 'user1pass'
  end
  factory :user2, class: User do
    name 'user2'
    email 'user2@email.com'
    password 'user2pass'
  end
end
