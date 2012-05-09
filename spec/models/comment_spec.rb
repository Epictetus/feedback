require 'spec_helper'

describe Feedback::Comment do
  before(:each) do
    @user = create(:user, name: "Bill Bixby")
    @blog_post = create(:blog_post, title: "Mr. McGee, Don't Make Me Angry")
    @comment = Feedback::Comment.create(:commentable => @blog_post, :author => @user)
    @reply_1 = Feedback::Comment.create(
      :commentable => @comment, 
      :author => @user, 
      :parent => @comment, 
      :body => "first reply"
    )
    @reply_2 = Feedback::Comment.create(
      :commentable => @comment, 
      :author => @user, 
      :parent => @comment, 
      :body => "second reply"
    )
    @reply_to_reply = Feedback::Comment.create(
      :commentable => @reply_1, 
      :author => @user, 
      :parent => @reply_1, 
      :body => "reply to the first reply"
    )
  end
  
  it "accepts a commentable" do
    @comment.commentable.title.should == "Mr. McGee, Don't Make Me Angry"
  end
  
  it "is attributable to a user" do
    @comment.author.name.should == "Bill Bixby"
  end
  
  it "can be replied to" do
    @reply_1.commentable.should eq(@comment)
    @comment.replies.should eq([@reply_1, @reply_2])
  end
  
end
