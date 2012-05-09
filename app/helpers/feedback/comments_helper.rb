module Feedback::CommentsHelper
  
  def feedback_comments_path_for(commentable)
    feedback_comments_url_for(commentable, :routing_type => :path)
  end
  
  def feedback_comments_url_for(commentable, options = {})
    options[:routing_type] ||= :url
    polymorphic_url([commentable, Feedback::Comment], options)
  end
  
  def sort_by_select_tag(options = {})
    criteria = ["Oldest first", "Newest first"]
    criteria.unshift("Rating") if defined?(Feedback::Models::Reviewable)
    criteria.unshift("Popularity") if defined?(Feedback::Models::Likable)
    select_tag "sort_by", options_for_select(criteria)
  end
  
end