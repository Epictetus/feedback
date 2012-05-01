require 'spec_helper'

describe Feedback::Comment do
  before(:each) do
    @user = create(:user, name: "Bill Bixby")
    @blog_post = create(:blog_post, title: "Mr. McGee, Don't Make Me Angry")
    @comment = Feedback::Comment.create(commentable: @blog_post, author: @user)
  end
  
  it "accepts a commentable" do
    @comment.commentable.title.should == "Mr. McGee, Don't Make Me Angry"
  end
  
  it "is attributable to a user" do
    @comment.author.name.should == "Bill Bixby"
  end
  
  it "can be replied to" do
    reply = Feedback::Comment.create(commentable: @comment, author: @user)
    reply.commentable.should eq(@comment)
    @comment.replies.should eq([reply])
  end
end
