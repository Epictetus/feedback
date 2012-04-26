require 'spec_helper'

describe Comment do
  before(:each) do
    @user = create(:user, name: "Bill Bixby")
    @blog_post = create(:blog_post, title: "Mr. McGee, Don't Make Me Angry")
    @comment = Comment.create(commentable: @blog_post, user: @user)
  end
  
  it "accepts a commentable" do
    @comment.commentable.title.should == "Mr. McGee, Don't Make Me Angry"
  end
  
  it "is attributable to a user" do
    @comment.user.name.should == "Bill Bixby"
  end
end
