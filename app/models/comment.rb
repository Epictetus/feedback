class Comment < ActiveRecord::Base
  attr_accessible :body, :commentable, :commentable_type, :status, :user
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
end
