# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'light_currency_convert/version'

Gem::Specification.new do |spec|
  spec.name          = "light_currency_convert"
  spec.version       = LightCurrencyConvert::VERSION
  spec.authors       = ["toma"]
  spec.email         = ["t0ma.popov.90@gmail.com"]

  spec.summary       = %q{This is a little gem for currency conversion. }
  spec.description   = %q{The gem adds a simple command line tool for currency conversion by given currencies in a json file.}
  spec.homepage      = "https://github.com/Tmpv/light_currency_converter"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['convert_currency']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activesupport", "~> 4.2.5"

end
