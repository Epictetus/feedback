class Feedback::CommentsController < ApplicationController
  
  respond_to :html, :json
  
  before_filter :find_commentable, :only => [:index, :create]
  before_filter :authenticate_user!, :only => [:create]
  
  def index
    @comments = @commentable.comments
  end
  
  def create
    @comment = Feedback::Comment.new(params[:feedback_comment])
    @comment.author = current_user
    @comment.commentable = @commentable
    
    if @comment.save!
      uri = @commentable.is_a?(Feedback::Comment) ? @commentable.root.commentable : @commentable
      redirect_to uri, :notice => "Comment saved."
    end
  end
  
  private
  
  def find_commentable
    type, id = /^\/(.*)\/(\d+)/.match(request.original_fullpath).to_a.slice(1,2)
    @commentable = type.classify.constantize.find(id)
    render :status => 404 unless @commentable
  end
end