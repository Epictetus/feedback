require "spec_helper"

describe Feedback::ReviewsController do
  
  describe "GET index" do
    before(:each) do
      @blog_post = create(:blog_post)
      @review = create(:review, :reviewable => @blog_post)
      get :index, :blog_post_id => @blog_post
    end

    it "assigns @reviews" do
      assigns(:reviews).should eq([@review])
    end
    
  end
  
  describe "POST create (review)" do
    before(:each) do
      @blog_post = create(:blog_post)
      @user = create(:user)
      sign_in @user
      post(
        :create, 
        :feedback_review => {:body => "I recommend this post.", :rating => 4.0}, 
        :blog_post_id => @blog_post.id
      )
    end
    
    it "creates the review" do
      assigns(:review).new_record?.should be(false)
      assigns(:review).body.should eq("I recommend this post.")
      assigns(:review).rating.should eq(4.0)
    end
    
    it "attributes authorship to the correct user" do
      assigns(:review).author.should eq(@user)
    end
    
    it "links the comment to the blog post" do
      assigns(:review).reviewable.should eq(@blog_post)
    end
    
    it "redirects to blog post" do
      response.should redirect_to(@blog_post)
    end
  end
  
end
