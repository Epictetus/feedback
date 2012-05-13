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
  gem "devise"
  gem "cancan"
  gem "jquery-rails"
  gem "haml-rails"
  gem "permanent_records", :git => "https://github.com/JackDanger/permanent_records.git"
end

group :test do
  gem "capybara"
  gem "factory_girl_rails"
  gem "guard-rspec"
  gem "rspec-rails"
  gem "sqlite3"
end

group :assets do
  gem "compass-h5bp"
  gem "compass_twitter_bootstrap", :path => "../compass-twitter-bootstrap"
  gem "html5-rails"
  gem "jquery-datatables-rails", :path => "../jquery-datatables-rails"
  gem "uglifier"
end

gem "debugger", :group => [:development, :test]
gem "rb-fsevent", :group => [:development, :test]