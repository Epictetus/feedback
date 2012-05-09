module Feedback::CommentsHelper
  
  def feedback_comments_path_for(commentable, options = {})
    options[:routing_type] ||= :path
    polymorphic_url([commentable, Feedback::Comment], options)
  end
  
  def feedback_comments_url_for(commentable, options = {})
    options[:routing_type] ||= :url
    polymorphic_url([commentable, Feedback::Comment], options)
  end
  
  def sort_by_select_tag(options = {})
    criteria = [["Oldest first", "created_at"], ["Newest first", "created_at DESC"]]
    criteria.unshift("Rating") if defined?(Feedback::Models::Reviewable)
    criteria.unshift("Popularity") if defined?(Feedback::Models::Likable)
    select_tag "sort_comments_by", options_for_select(criteria, options[:selected])
  end
  
end