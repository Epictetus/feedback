class Feedback::Admin::CommentsController < Feedback::ApplicationController
  
  include ActionView::Helpers::TextHelper
  
  before_filter :authenticate_user!
  before_filter :authorize_user!
  before_filter :load_comments, :except => [:index, :show, :mass_assign]
  
  def index
    @comments = Feedback::Comment.all
    @deleted_comments = Feedback::Comment.deleted_only
  end
  
  def show
    @comment = Feedback::Comment.find(params[:id])
  end
  
  def update
    if @comments.each{ |c| c.update_attributes(params[:feedback_comment]) }
      redirect_to feedback_admin_comments_path, :notice => "#{pluralize(@comments.size, 'comment')} updated."
    end
  end
  
  def destroy
    if @comments.each(&:soft_delete)
      redirect_to feedback_admin_comments_path, :notice => "Deleted #{pluralize(@comments.size, 'comment')}."
    end
  end
  
  def mass_assign
    @comments = params[:selected_ids] ? Feedback::Comment.unscoped.find(params[:selected_ids]) : []
    self.send(params[:commit])
  end
  
  private
  
  def authorize_user!
    authorize! :manage, Feedback::Comment
  end
  
  def load_comments
    @comments = [Feedback::Comment.unscoped.find(params[:id])]
  end
  
  def restore
    mass_update :deleted_at => nil
  end
  
  def flag_as_spam
    mass_update :status => "spam"
  end
  
  def flag_as_inappropriate
    mass_update :status => "inappropriate"
  end
  
  def unflag
    mass_update :status => nil
  end
  
  def mass_update(attributes)
    params[:feedback_comment] = attributes
    update
  end
  
end