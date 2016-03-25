# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'haml_lint/rake_task'

Rails.application.load_tasks
HamlLint::RakeTask.new do |t|
  t.config = 'custom/config.yml'
  t.files = ['app/views', 'custom/*.haml']
  t.quiet = true # Don't display output from haml-lint to STDOUT
end
