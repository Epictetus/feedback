class Feedback::Review < ActiveRecord::Base
  
  attr_protected
  
  belongs_to :reviewable, :polymorphic => true
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  validates_presence_of :user_id, :reviewable_id, :reviewable_type, :body, :rating
  
  is_soft_deletable
  
  def to_s
    "#{body} (rating: #{rating})"
  end
  
end
