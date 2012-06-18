FactoryGirl.define do
  factory :comment, :class => Feedback::Comment do |c|
    c.association :author, :factory => :user
    c.association :commentable, :factory => :blog_post
    c.body "some text"
  end
end