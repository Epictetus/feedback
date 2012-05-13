class Feedback::Admin::CommentsController < Feedback::ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    authorize! :index, Feedback::Comment
    @comments = Feedback::Comment.all
  end
  
  def update
    authorize! :update, Feedback::Comment
    @comment = Feedback::Comment.find(params[:id])
    if @comment.update_attributes(params[:feedback_comment])
      redirect_to feedback_admin_comments_path, :notice => "Comment updated."
    end
  end
  
  def destroy
    authorize! :destroy, Feedback::Comment
    @comment = Feedback::Comment.find(params[:id])
    if @comment.destroy
      redirect_to feedback_admin_comments_path, :notice => "Comment deleted."
    end
  end
end