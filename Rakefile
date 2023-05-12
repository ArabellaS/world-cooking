# # Add your own tasks in files placed in lib/tasks ending in .rake,
# # for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# require_relative "config/application"

# Rails.application.load_tasks

# #!/usr/bin/env rake

require_relative 'config/application'
require 'rake'

Rails.application.load_tasks

task :default => [:test]

desc "Run tests"
RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = "spec/**/*_spec.rb"
end
