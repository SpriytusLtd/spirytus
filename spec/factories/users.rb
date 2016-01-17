FactoryGirl.define do
  factory :user1, class: User do
    email 'user1@email.com'
    password 'user1pass'
  end
  factory :user2, class: User do
    email 'user2@email.com'
    password 'user2pass'
  end
end
