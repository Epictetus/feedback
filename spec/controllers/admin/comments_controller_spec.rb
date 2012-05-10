require "spec_helper"

describe Feedback::Admin::CommentsController do
  
  describe "GET index" do
    
    before(:each) do
      @user = create(:user)
      @admin = create(:user, :admin => true)
      @blog_post = create(:blog_post)
      @comment = create(:comment, :commentable => @blog_post)
    end
    
    it "should deny access to non-admins" do
      sign_in @user
      get :index
      response.should redirect_to(root_url)
    end
    
    it "assigns @comments and renders index template" do
      sign_in @admin
      get :index
      assigns(:comments).should eq([@comment])
      response.should render_template("index")
    end
    
  end
  
end