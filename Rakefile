require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

task default: :spec

desc 'load gem files into IRB'
task :console do
  exec 'irb -Ilib -radjustment_bureau'
end
