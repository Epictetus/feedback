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
      response.should redirect_to(root_path)
    end
    
    it "assigns @comments and renders index template" do
      sign_in @admin
      get :index
      assigns(:comments).should eq([@comment])
      response.should render_template("index")
    end
    
  end
  
  describe "PUT update" do
    before(:each) do
      @blog_post = create(:blog_post)
      @comment = create(:comment, :commentable => @blog_post)
      @user = create(:user)
      @admin = create(:user, :admin => true)
    end
    
    it "should deny access to guests" do
      put :update
      response.should redirect_to(new_user_session_path)
    end
    
    it "should deny access to non-admin users" do
      sign_in @user
      put :update
      response.should redirect_to(root_path)
    end
    
    it "flags comments" do
      sign_in @admin
      put(
        :update, 
        :id => @comment.id, 
        :feedback_comment => { :status => "inappropriate" }
      )
      response.should redirect_to(feedback_admin_comments_path)
      @comment.reload.status.should eq("inappropriate")
    end

    it "delete comments" do
      sign_in @admin
      Feedback::Comment.count.should eq(1)
      delete(:destroy, :id => @comment.id)
      response.should redirect_to(feedback_admin_comments_path)
      Feedback::Comment.count.should eq(0)
    end
  end

end