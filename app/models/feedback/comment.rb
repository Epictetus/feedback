class Feedback::Comment < ActiveRecord::Base
  attr_protected
  
  belongs_to :commentable, :polymorphic => true
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  validates_presence_of [:user_id, :commentable_id, :commentable_type]
  
  def replies
    Feedback::Comment.where(
      :commentable_id => id, 
      :commentable_type => "Feedback::Comment"
    )
  end
end
