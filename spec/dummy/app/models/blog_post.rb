class BlogPost < ActiveRecord::Base
  acts_as_commentable
  attr_accessible :body, :title, :user_id
end
