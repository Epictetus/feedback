class Feedback::Comment < ActiveRecord::Base
  
  attr_protected
  
  belongs_to :commentable, :polymorphic => true
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  validates_presence_of :user_id, :commentable_id, :commentable_type, :body
  
  is_soft_deletable
  has_comments
  has_ancestry
  
  def to_s
    body
  end
  
  def replies
    children
  end
  
  def root_commentable
    root.commentable
  end
  
end
