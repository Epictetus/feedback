require "spec_helper"

describe "routes for Commentables" do
  
  before(:each) do
    @blog_post = create(:blog_post, title: "Holla if ya hear me")
    @comment = create(:comment)
  end
  
  it "generates commentable_routes_for named routes" do
   { :get => blog_post_feedback_comments_path(@blog_post) }.
      should route_to(
        :controller => "feedback/comments", 
        :action => "index", 
        :blog_post_id => "#{@blog_post.id}"
      )
  end
  
end