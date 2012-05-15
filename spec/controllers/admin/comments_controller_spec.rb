require "spec_helper"

describe Feedback::Admin::CommentsController do
  
  describe "GET index" do
    
    before(:each) do
      @user = create(:user)
      @admin = create(:user, :admin => true)
      @blog_post = create(:blog_post)
      @comment = create(:comment, :commentable => @blog_post)
      @deleted_comment = create(:comment, :deleted_at => Time.now)
    end
    
    it "should deny access to non-admins" do
      sign_in @user
      get :index
      response.should redirect_to(root_path)
    end
    
    it "assigns non-deleted comments" do
      sign_in @admin
      get :index
      assigns(:comments).should eq([@comment])
      assigns(:deleted_comments).should eq([@deleted_comment])
    end
    
    # TODO: figure out why this spec is causing "can return all comments including deleted ones" model spec to fail 
    # it "optionally assigns deleted comments" do
    #   sign_in @admin
    #   get :index, :with_deleted => true
    #   assigns(:comments).should eq([@comment, @deleted_comment])
    # end
    
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
    
    it "flags multiple comments" do
      sign_in @admin
      another_comment = create(:comment)
      Feedback::Comment.count.should eq(2)
      post(
        :mass_assign, 
        :commit => "update", 
        :selected_ids => [@comment.id, another_comment.id], 
        :feedback_comment => { :status => "spam" }
      )
      response.should redirect_to(feedback_admin_comments_path)
      Feedback::Comment.count.should eq(2)
      @comment.reload.status.should eq("spam")
      another_comment.reload.status.should eq("spam")
    end
    
    it "deletes individual comments" do
      sign_in @admin
      Feedback::Comment.count.should eq(1)
      delete(:destroy, :id => @comment.id)
      response.should redirect_to(feedback_admin_comments_path)
      Feedback::Comment.count.should eq(0)
    end
  
    it "deletes multiple comments" do
      sign_in @admin
      another_comment = create(:comment)
      Feedback::Comment.count.should eq(2)
      post(:mass_assign, :commit => "destroy", :selected_ids => [@comment.id, another_comment.id])
      response.should redirect_to(feedback_admin_comments_path)
      Feedback::Comment.count.should eq(0)
    end
    
    it "undeletes individual comments" do
      sign_in @admin
      deleted_comment = create(:comment, :deleted_at => Time.now)
      put(
        :update, 
        :id => deleted_comment.id, 
        :feedback_comment => { :deleted_at => nil }
      )
      response.should redirect_to(feedback_admin_comments_path)
      deleted_comment.reload.deleted?.should eq(false)
    end
    
  end
  
  describe "GET show" do
    it "assigns comment and renders show action" do
      comment = create(:comment)
      get :show, :id => comment.id
      assigns(:comment)
    end
  end

end