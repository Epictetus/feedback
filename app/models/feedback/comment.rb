class Feedback::Comment < ActiveRecord::Base
  attr_protected
  
  belongs_to :commentable, :polymorphic => true
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  has_comments
  has_ancestry
  
  validates_presence_of [:user_id, :commentable_id, :commentable_type]
  
  def replies
    children
  end
  
  def root_commentable
    root.commentable
  end

end
