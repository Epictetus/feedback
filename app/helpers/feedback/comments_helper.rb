module Feedback::CommentsHelper
  
  def feedback_comments_path_for(commentable)
    feedback_comments_url_for(commentable, :routing_type => :path)
  end
  
  def feedback_comments_url_for(commentable, options = {})
    options[:routing_type] ||= :url
    polymorphic_url([commentable, Feedback::Comment], options)
  end
  
end