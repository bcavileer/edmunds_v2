require 'bundler/gem_tasks'
require 'yard-ghpages'
Yard::GHPages::Tasks.install_tasks

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task :default => :spec
rescue LoadError
end
