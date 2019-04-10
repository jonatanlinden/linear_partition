require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rake/extensiontask"

RSpec::Core::RakeTask.new(:spec)

Rake::ExtensionTask.new("linear_partition") do |ext|
	ext.lib_dir = "lib/linear_partition"
end

task :default => [:compile, :spec]
