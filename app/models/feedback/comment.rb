class Feedback::Comment < ActiveRecord::Base
  attr_protected
  
  belongs_to :commentable, :polymorphic => true
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  has_comments
  has_ancestry
  
  validates_presence_of [:user_id, :commentable_id, :commentable_type]
  
  default_scope where(:deleted_at => nil)
  
  def to_s
    body
  end
  
  def replies
    children
  end
  
  def root_commentable
    root.commentable
  end
  
  def soft_delete
    self.update_attribute(:deleted_at, Time.now)
  end
  
  def undelete
    Feedback::Comment.unscoped do
      self.update_attribute(:deleted_at, nil)
    end
  end
  
  def self.deleted_only
    Feedback::Comment.unscoped.where("deleted_at IS NOT NULL")
  end
  
  def deleted?
    deleted_at.present?
  end
    
end
