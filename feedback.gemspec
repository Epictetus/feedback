$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feedback/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feedback"
  s.version     = Feedback::VERSION
  s.authors     = ["Taurus Colvin"]
  s.email       = ["taurus.colvin@gmail.com"]
  s.homepage    = "http://www.tauruscolvin.com"
  s.summary     = "A Rails 3 engine which adds full-stack user feedback features to your application."
  s.description = "A Rails 3 engine which adds full-stack user feedback features to your application."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "ancestry"
  s.add_dependency "coffee-rails"
  s.add_dependency "compass-rails"
  s.add_dependency "haml-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependency "sass-rails"
  
end
