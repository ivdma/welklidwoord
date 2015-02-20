# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'welklidwoord/version'

Gem::Specification.new do |spec|
  spec.name          = 'welklidwoord'
  spec.version       = Welklidwoord::VERSION
  spec.authors       = ['Ivan Malykh']
  spec.email         = ['ivan@lesslines.com']

  spec.summary       = %q(This gem is a command-line wrapper for 'Welklidwoord.nl')
  spec.description   = %q(This gem is wraps Welklidwoord.nl into command-line tool)
  spec.homepage      = 'http://welklidwoord.nl'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.5'

  spec.add_dependency 'nokogiri', '~> 1.6'
  spec.add_dependency 'rainbow', '~> 2.0'
end
