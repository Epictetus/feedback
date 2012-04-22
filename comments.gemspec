$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "comments/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "comments"
  s.version     = Comments::VERSION
  s.authors     = ["Taurus Colvin"]
  s.email       = ["taurus.colvin@gmail.com"]
  s.homepage    = "http://www.tauruscolvin.com"
  s.summary     = "An engine which provides commenting features to any Rails 3 application."
  s.description = "An engine which provides commenting features to any Rails 3 application."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
