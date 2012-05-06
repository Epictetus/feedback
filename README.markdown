# Feedback

A Rails 3 engine which adds full-stack user feedback to your application.

## <a name="features"></a>Features

* Comment on models with `has_comments`.
* Review models with `has_reviews`.
* Like models with `has_likes`.
* Use view helpers to add pre-built feedback UI elements to your pages.
* Control feedback rules and spam filtering.
* Manage feedback flagged as spam or inappropriate with an easy admin interface.

## <a name="demo"></a>Screencast

Coming soon...

## <a name="installation"></a>Installation
Add the feedback gem to your `Gemfile`:

    gem 'feedback', :git => "git://github.com/colvint/feedback.git"

Run:

    $ bundle install

And then run:

    $ rails g feedback:install
