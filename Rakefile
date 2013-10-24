require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs.concat %w(open_actions spec)
  t.pattern = "spec/**/*_spec.rb"
end

task :default => [:test]
