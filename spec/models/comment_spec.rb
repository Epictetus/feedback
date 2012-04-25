require 'spec_helper'

describe Comment do
  before(:each) do
    @user = create(:user, name: "Bill Bixby")
    @blog_post = create(:blog_post, title: "A great thought")
    @comment = Comment.new(commentable: @blog_post, user: @user)
  end
  
  it "accepts a commentable" do
    @comment.commentable.title.should == "A great thought"
  end
  
  it "is attributable to a user" do
    @comment.user.name.should == "Bill Bixby"
  end
end
