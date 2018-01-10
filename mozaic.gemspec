# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'mozaic', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'mozaic'
    gem.version               = Mozaic::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'Mozaic is an opinionated layout engine for Rails'
    gem.description           = 'Mozaic is an opinionated layout engine for Rails. It simplifies handling numerous layouts and components.'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'me@jonhue.me'
    gem.homepage              = 'https://github.com/jonhue/mozaic'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'app/**/*']
    gem.require_paths         = ['lib']

    gem.add_dependency 'railties', '>= 5.0'
    gem.add_dependency 'activesupport', '>= 5.0'
    gem.add_dependency 'nestive-rails', '~> 1.0'
    gem.required_ruby_version = '>= 2.3'

    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
