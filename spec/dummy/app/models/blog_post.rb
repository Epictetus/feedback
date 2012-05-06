class BlogPost < ActiveRecord::Base
  has_comments
  attr_accessible :body, :title, :user_id
end
