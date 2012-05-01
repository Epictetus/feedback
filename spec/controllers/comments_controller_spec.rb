require "spec_helper"

describe Feedback::CommentsController do
  describe "GET index" do
    before(:each) do
      @blog_post = create(:blog_post)
      @comment = create(:comment, :commentable => @blog_post)
      get :index, :blog_post_id => @blog_post
    end

    it "assigns @comments" do
      assigns(:comments).should eq([@comment])
    end
    
    it "renders the index template" do
      response.should render_template("index")
    end
  end
  
  describe "POST create" do
    before(:each) do
      @blog_post = create(:blog_post)
      @user = create(:user)
      post(
        :create, 
        :feedback_comment => {:body => "This is a great post"}, 
        :blog_post_id => 1
      )
    end
    
    it "assigns @comment" do
      assigns(:comment)
    end
    
    it "creates the comment" do
      assigns(:comment).new_record?.should be(false)
    end
    
    it "attributes authorship to the correct user" do
      assigns(:comment).author.should eq(@user)
    end
    
    it "links the comment to the blog post" do
      assigns(:comment).commentable.should eq(@blog_post)
    end
    
    it "fills in the provided comment body" do
      assigns(:comment).body.should eq("This is a great post")
    end
    
    it "redirects to blog post" do
      response.should redirect_to(@blog_post)
    end
  end
end