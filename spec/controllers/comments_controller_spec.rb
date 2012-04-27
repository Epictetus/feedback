require "spec_helper"

describe CommentsController do
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
      post :create, :comment => {
        :user_id => @user, 
        :commentable_id => @blog_post, 
        :commentable_type => @blog_post.class, 
        :body => "This is a great post"
      }
    end
    
    it "assigns @comment" do
      assigns(:comment)
    end
    
    it "redirects to blog post" do
      response.should redirect_to(@blog_post)
    end
  end
end