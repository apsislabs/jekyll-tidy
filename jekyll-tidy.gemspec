# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/tidy/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-tidy"
  spec.version       = Jekyll::Tidy::VERSION
  spec.authors       = ["Wyatt Kirby"]
  spec.email         = ["wyatt@apsis.io"]

  spec.summary       = %q{Sanitize and Tidy HTML Output for Jekyll}
  spec.homepage      = "http://www.apsis.io"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*").concat(%w(LICENSE.txt README.md))
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll"
  spec.add_runtime_dependency "htmlbeautifier"
  spec.add_runtime_dependency "htmlcompressor"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "byebug", "~> 10.0"
end
