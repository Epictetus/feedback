require "spec_helper"

describe CommentsController do
  describe "GET index" do
    before(:each) do
      @blog_post = create(:blog_post)
    end
    
    it "assigns @comments" do
      comment = create(:comment, :commentable => @blog_post)
      get :index, :blog_post_id => @blog_post
      assigns(:comments).should eq([comment])
    end
  end
end