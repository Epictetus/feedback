require "spec_helper"

describe Feedback::CommentsHelper do
  
  describe "url helpers" do

    it "returns the correct feedback comments path for blog posts" do
      helper.feedback_comments_path_for(create(:blog_post)).should == "/blog_post/1/feedback/comments"
    end

    it "returns the correct feedback comments path for comments" do
      helper.feedback_comments_path_for(create(:comment)).should == "/feedback/comment/1/feedback/comments"
    end
    
  end
  
end