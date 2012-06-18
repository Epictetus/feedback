FactoryGirl.define do
  factory :review, :class => Feedback::Review do |o|
    o.association :author, :factory => :user
    o.association :reviewable, :factory => :blog_post
    o.body "some text"
    o.rating 4.0
  end
end