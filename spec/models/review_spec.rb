require 'spec_helper'

describe Feedback::Review do
  
  before(:each) do
    @user = create(:user, name: "Bill Bixby")
    @blog_post = create(:blog_post, title: "Mr. McGee, Don't Make Me Angry")
    @review = Feedback::Review.create!(:reviewable => @blog_post, :author => @user, :body => "a good thing", :rating => 4.5)
  end
  
  it "accepts a reviewable" do
    @review.reviewable.title.should == "Mr. McGee, Don't Make Me Angry"
  end
  
  it "is attributable to a user" do
    @review.author.name.should == "Bill Bixby"
  end
  
end
