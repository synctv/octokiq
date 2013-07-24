require File.expand_path('../lib/octokiq/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "octokiq"
  gem.version       = Octokiq::VERSION
  gem.authors       = ["Chris Trinh"]
  gem.email         = ["chris.chtrinh@gmail.com"]
  gem.summary       = " "
  gem.description   = " "
  gem.homepage      = " "
  gem.files         = `git ls-files`.split("\n") - %w[octokiq.gemspec Gemfile init.rb]
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]

  gem.add_dependency 'sidekiq'
  gem.add_dependency 'ar-octopus'
end
