class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def authenticate_user!
    session[:current_user_id] = stub_user.id
  end
  
  def current_user
    User.find(session[:current_user_id])
  end

  def stub_user
    User.first || User.create(:name => "Tommy Twotoes", :email => "tommyt2@example.com")
  end  
end
