# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/tidy/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-tidy"
  spec.version       = Jekyll::Tidy::VERSION
  spec.authors       = ["Wyatt Kirby"]
  spec.email         = ["kirby.wa@gmail.com"]
  spec.summary       = %q{Sanitize and Tidy HTML Output for Jekyll}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll"
  spec.add_dependency "htmlbeautifier"
  spec.add_dependency "sanitize"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
