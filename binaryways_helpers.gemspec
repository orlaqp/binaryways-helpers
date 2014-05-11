$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "binaryways_helpers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "binaryways-helpers"
  s.version     = BinarywaysHelpers::VERSION
  s.authors     = ["Orlando Quero"]
  s.email       = ["orlaqp@gmail.com"]
  s.homepage    = "https://github.com/orlaqp"
  s.summary     = "A collection of generators and extensions to make my life easy when developing rails applications."
  s.description = "A collection of generators and extensions to make my life easy when developing rails applications."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.1"
  s.add_dependency "ember-rails"

  # s.add_development_dependency "sqlite3"
end
