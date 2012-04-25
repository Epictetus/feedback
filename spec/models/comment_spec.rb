require 'spec_helper'

describe Comment do
  before(:each) do
    @user = mock_model("User", :name => "Bill Bixby")
    class BlogPost < ActiveRecord::Base
      acts_as_commentable
    end
    CommentableMigration.up
    @blog_post = BlogPost.create(:title => "A great thought")
    @comment = Comment.new(:commentable => @blog_post, :user => @user)
  end
  
  it "accepts a commentable" do
    @comment.commentable.title.should == "A great thought"
  end
  
  it "is attributable to a user" do
    @comment.user.name.should == "Bill Bixby"
  end
end
