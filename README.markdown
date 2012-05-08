# Feedback

A Rails 3 engine which adds full-stack user feedback to your application.

## <a name="features"></a>Features

* Uses [HTML5 Boilerplate](https://github.com/sporkd/compass-h5bp), [Twitter Bootstrap with Compass](https://github.com/vwall/compass-twitter-bootstrap).
* Comment on models with `has_comments`.
* Review models with `has_reviews`.
* Like models with `has_likes`.
* Use view helpers to add pre-built feedback UI elements to your pages.
* Control feedback rules and spam filtering.
* Manage feedback flagged as spam or inappropriate with an easy admin interface.

## <a name="demo"></a>Skitches

![New Comment](https://img.skitch.com/20120508-8dpbm4n4myxfb4wwr98uuiqsi8.jpg)

## <a name="installation"></a>Installation
Add the feedback gem to your `Gemfile`:

    gem 'feedback', :git => "git://github.com/colvint/feedback.git"

Install the gem with:

    $ bundle install

And then run to copy feedback migrations into your app:

    $ rake feedback_engine:install:migrations

Then run migrations to create comments:

    $ rake db:migrate
    
Make your model commentable with `has_comments`:

```ruby
class BlogPost < ActiveRecord::Base
  has_comments
  attr_accessible :body, :title, :user_id
end
```
Add a comment widget to your app's view like this:

```ruby
= render "feedback/comments/widget", :commentable => @blog_post
```
