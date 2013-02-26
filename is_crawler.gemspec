# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'is_crawler/version'

Gem::Specification.new do |gem|
  gem.name          = "is_crawler"
  gem.version       = IsCrawler::VERSION
  gem.authors       = ["Chris Cashwell"]
  gem.email         = ["ccashwell@gmail.com"]
  gem.description   = %q{is_crawler does just what you might expect: detect whether the current request is from a crawler.}
  gem.summary       = %q{Simple, effective crawler and bot detection.}
  gem.homepage      = "http://github.com/ccashwell/is_crawler"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
end
