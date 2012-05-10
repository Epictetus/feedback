class Feedback::CommentsController < ApplicationController
  
  include Feedback::CommentsHelper
  
  respond_to :html, :json, :atom
  
  before_filter :find_commentable
  before_filter :authenticate_user!, :only => [:create, :update]
  
  def index
    @comments = @commentable.comments
  end
  
  def create
    @comment = Feedback::Comment.new(params[:feedback_comment].merge(
        :author => current_user, 
        :commentable => @commentable
      )
    )

    if @comment.save!
      if @commentable.is_a?(Feedback::Comment)
        @comment.parent = @commentable
        @comment.save
      end
      redirect_to_commentable :notice => "Comment saved."
    end
  end
  
  def update
    @comment = Feedback::Comment.find(params[:id])
    if @comment.update_attributes(params[:feedback_comment])
      redirect_to_commentable :notice => "Comment updated."
    end
  end
  
  private
  
  def find_commentable
    type, id = /^\/(\w*|\w*\/\w*)\/(\d+)/.match(request.original_fullpath).to_a.slice(1,2)
    @commentable = type.classify.constantize.find(id)
    render :status => 404 unless @commentable
  end
  
  def redirect_to_commentable(options = {})
    url = if @commentable.is_a?(Feedback::Comment)
      feedback_comments_path_for(@commentable.root.commentable, :anchor => "comment-#{@comment.id}")
    else
      @commentable
    end
    redirect_to url, :notice => options[:notice]
  end
end