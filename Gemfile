source "http://rubygems.org"

# Declare your gem's dependencies in comments.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

group :development do
  gem "jquery-rails"
  gem "haml-rails"
end

group :test do
  gem "capybara"
  gem "factory_girl_rails"
  gem "guard-rspec"
  gem "rspec-rails"
  gem "sqlite3"
end

group :assets do
  gem "coffee-rails"
  gem "compass-h5bp"
  gem "compass-rails"
  gem "compass_twitter_bootstrap", :git => "https://github.com/vwall/compass-twitter-bootstrap.git"
  gem "sass-rails"
  gem "html5-rails"
  gem "uglifier"
end

gem "debugger", :group => [:development, :test]
gem "rb-fsevent", :group => [:development, :test]