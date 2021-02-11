Gem::Specification.new do |gem|
  gem.name = 'resque-sentry'
  gem.version = '2.0.1'
  gem.authors = ['Harry Marr']
  gem.email = ['harry@gocardless.com']
  gem.summary = 'A failure backend for Resque that sends events to Sentry'
  gem.homepage = 'https://github.com/gocardless/resque-sentry'

  gem.add_dependency 'resque', '~> 2.0'
  gem.add_dependency 'sentry-ruby', '~> 4.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'mocha', '~> 1.0'

  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- spec/*`.split("\n")
end
