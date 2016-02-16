$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "faalis/comments/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "faalis-comments"
  s.version     = Faalis::Comments::VERSION
  s.authors     = ["Sameer Rahmani"]
  s.email       = ["lxsameer@gnu.org"]
  s.homepage    = "https://github.com/Yellowen/faalis_comments"
  s.summary     = "Comments Engine for Faalis."
  s.description = "Comments Engine for Faalis. It provides a commentable functionality for each model you want."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'faalis', '~> 2'
  s.add_dependency 'acts_as_commentable_with_threading'

  s.add_development_dependency 'sqlite3'
end
