FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "User #{ n }"
    end
    sequence :email do |n|
      "user#{ n }@example.com"
    end
  end
end