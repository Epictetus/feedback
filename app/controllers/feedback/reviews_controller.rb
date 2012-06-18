class Feedback::ReviewsController < Feedback::ApplicationController
  
  respond_to :html, :json, :atom
  
  before_filter :find_reviewable
  before_filter :authenticate_user!, :only => [:create, :update]
  
  def index
    @reviews = @reviewable.reviews
  end
  
  def create
    @review = Feedback::Review.new(
      params[:feedback_review].merge(:author => current_user, :reviewable => @reviewable)
    )

    if @review.save!
      redirect_to_reviewable :notice => "Review saved."
    end
  end
  
  private
  
  def find_reviewable
    type, id = /^\/(\w*|\w*\/\w*)\/(\d+)/.match(request.original_fullpath).to_a.slice(1,2)
    @reviewable = type.classify.constantize.find(id)
    render :status => 404 unless @reviewable
  end
  
  def redirect_to_reviewable(options = {})
    url = if @reviewable.is_a?(Feedback::Review)
      feedback_reviews_path_for(@reviewable, :anchor => "review-#{@review.id}")
    else
      @reviewable
    end
    redirect_to url, :notice => options[:notice]
  end
end