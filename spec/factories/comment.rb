FactoryGirl.define do
  factory :comment, :class => Feedback::Comment do |c|
    c.association :user, :factory => :user
    c.association :commentable, :factory => :blog_post
  end
end