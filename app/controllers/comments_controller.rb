class CommentsController < ApplicationController
  
  respond_to :html, :json
  
  before_filter :find_commentable, :only => [:index]
  
  def index
    @comments = @commentable.comments
  end
  
  def create
    if @comment = Comment.create!(params[:comment])
      flash[:notice] = "Comment saved."
    end
    respond_with(@comment, :location => @comment.commentable)
  end
  
  private
  
  def find_commentable
    params.each do |name, value|  
      if name =~ /(.+)_id$/  
        @commentable = $1.classify.constantize.find(value)  
      end  
    end
    render :status => 404 unless @commentable
  end
end