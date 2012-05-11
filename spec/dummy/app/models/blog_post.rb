class BlogPost < ActiveRecord::Base
  attr_protected
  has_comments
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
end
