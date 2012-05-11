# Feedback

Add commenting, reviewing, rating and liking features to your Rails 3 app 
with the Feedback engine. Inspired by Devise, Drupal, Refinery CMS and 
Joomla, this Rails engine is one in a series designed to address very 
common high-level use cases.

## <a name="features"></a>Features

* Uses [HTML5 Boilerplate](https://github.com/sporkd/compass-h5bp), [Twitter Bootstrap with Compass](https://github.com/vwall/compass-twitter-bootstrap).
* Comment on models with `has_comments`.
* Review models with `has_reviews`.
* Like models with `has_likes`.
* Comes with pre-built feedback partials ready for use in your views.
* Control feedback rules and spam filtering.
* Manage feedback flagged as spam or inappropriate with an easy admin interface.

## <a name="demo"></a>Screenshots

### New Comments

![New Comment](https://img.skitch.com/20120508-cs6fw8m4b2ib1tjhyywjuu1pwp.jpg)

### Replying to Comments

![Replying](https://img.skitch.com/20120508-n2why5mnr4x33e7unaqht343y3.jpg)

### Threaded Replies

![Threaded Replies](https://img.skitch.com/20120508-e675nhjfig8y3rhwsar7n5kac9.jpg)

### Admin Backend

![Admin Backend](https://img.skitch.com/20120511-1wbeawdnkpic2iukk9uneg1h4k.jpg)

## <a name="installation"></a>Installation
Add the feedback gem to your `Gemfile`:

    gem 'feedback', :git => "git://github.com/colvint/feedback.git"

Install the gem with:

    $ bundle install

Copy feedback migrations into your app:

    $ rake feedback_engine:install:migrations

Run migrations to create comments:

    $ rake db:migrate

Include feedback javascript assets in your `app/assets/javascripts/application.js` with this:

    //= require feedback

Include feedback stylesheet assets in your `app/assets/stylesheets/application.css.sass` with this:

    @import feedback/all

Make any models commentable with `has_comments`:

```ruby
class BlogPost < ActiveRecord::Base
  has_comments
  attr_accessible :body, :title, :user_id
end
```
Add a comment widget to any app view:

```ruby
= render "feedback/comments/widget", :commentable => @blog_post
```