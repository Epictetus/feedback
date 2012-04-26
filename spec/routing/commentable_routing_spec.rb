require "spec_helper"

describe "routes for Commentables" do
  
  before(:each) do
    @blog_post = create(:blog_post, title: "Holla if ya hear me")
  end
  
  it "generates commentable_routes_for named routes" do
    blog_post_comments_path(@blog_post).should == "/blog_post/1/comments"
  end
end