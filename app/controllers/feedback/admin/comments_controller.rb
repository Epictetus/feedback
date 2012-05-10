class Feedback::Admin::CommentsController < Feedback::ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    authorize! :index, Feedback::Comment
    @comments = Feedback::Comment.all
  end
  
end