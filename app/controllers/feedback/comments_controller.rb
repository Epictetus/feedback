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
      redirect_to @commentable, :notice => "Comment saved."
    end
  end
  
  private
  
  def find_commentable
    params.each do |name, value|  
      if name =~ /(.+)_id$/  
        @commentable = $1.classify.constantize.find(value)  
        break
      end  
    end
    render :status => 404 unless @commentable
  end
end