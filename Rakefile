require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs.concat %w(open_actions spec)
  t.pattern = "spec/**/*_spec.rb"
end

task :console do |t|
  $LOAD_PATH << 'open_actions'
  require 'open_actions'
  require 'irb'
  ARGV.clear
  IRB.start
end

task :default => [:test]
