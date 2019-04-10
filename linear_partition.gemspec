# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "linear_partition/version"

Gem::Specification.new do |spec|
  spec.name          = "linear_partition"
  spec.version       = LinearPartition::VERSION
  spec.authors       = ["Jonatan Lindén"]
  spec.email         = ["linden.jonatan@gmail.com"]

  spec.summary       = %q(When you really need to compute a linear k-partition, fast.)
  spec.homepage      = "https://github.com/jonatanlinden/linear_partition"
  spec.license       = "MIT"

  spec.extensions    = ['ext/linear_partition/extconf.rb']

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = [
    'ext/linear_partition/linear_partition.c',
    'lib/linear_partition/version.rb',
    'lib/linear_partition.rb'
  ]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec", "~> 3.0"
end
