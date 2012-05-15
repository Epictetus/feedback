class Feedback::Admin::CommentsController < Feedback::ApplicationController
  
  include ActionView::Helpers::TextHelper
  
  before_filter :authenticate_user!
  before_filter :load_comments, :except => [:index, :show, :mass_assign]
  
  def index
    authorize! :index, Feedback::Comment
    @comments = Feedback::Comment.all
    @deleted_comments = Feedback::Comment.deleted_only
  end
  
  def show
    @comment = Feedback::Comment.find(params[:id])
  end
  
  def update
    authorize! :update, Feedback::Comment
    if @comments.each{ |c| c.update_attributes(params[:feedback_comment]) }
      redirect_to feedback_admin_comments_path, :notice => "Comment updated."
    end
  end
  
  def destroy
    authorize! :destroy, Feedback::Comment
    if @comments.each(&:soft_delete)
      redirect_to feedback_admin_comments_path, :notice => "Deleted #{pluralize(@comments.size, 'comment')}."
    end
  end
  
  def mass_assign
    authorize! :manage, Feedback::Comment
    @comments = Feedback::Comment.unscoped.find(params[:selected_ids])
    self.send(params[:commit])
  end
  
  private
  
  def load_comments
    authorize! :manage, Feedback::Comment
    @comments = [Feedback::Comment.unscoped.find(params[:id])]
  end
end