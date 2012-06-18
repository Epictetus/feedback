class BlogPost < ActiveRecord::Base
  attr_protected
  
  # feedback methods
  has_comments
  has_reviews
  
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  def to_s
    title
  end
end
