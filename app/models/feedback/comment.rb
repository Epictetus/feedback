class Feedback::Comment < ActiveRecord::Base
  attr_protected
  
  belongs_to :commentable, :polymorphic => true
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  has_comments
  has_ancestry
  
  validates_presence_of [:user_id, :commentable_id, :commentable_type]
  
  #permanent_records convenience methods
  default_scope where(:deleted_at => nil)
  def self.deleted
    self.unscoped.where('deleted_at IS NOT NULL')
  end
  
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
