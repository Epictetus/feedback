class Comment < ActiveRecord::Base
  attr_accessible :body, :commentable, :commentable_type, :status, :user
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  
  validates_presence_of [:user_id, :commentable_id, :commentable_type]
  
  def replies
    Comment.where(
      :commentable_id => id, 
      :commentable_type => "Comment"
    )
  end
end
