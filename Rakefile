require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:test) do |config|
  config.rspec_opts = "-cf d"
end

task default: [:test, :build]
