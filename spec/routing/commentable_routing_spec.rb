require "spec_helper"

describe "routes for Commentables" do
  
  before(:each) do
    @blog_post = create(:blog_post, title: "Holla if ya hear me")
    @comment = create(:comment)
  end
  
  it "generates commentable_routes_for named routes" do
    blog_post_feedback_comments_path(@blog_post).should == "/blog_post/1/feedback/comments"
    feedback_comment_feedback_comments_path(@comment).should == "/feedback/comment/1/feedback/comments"
    feedback_admin_comments_path.should == "/feedback/admin/comments"
  end
  
end