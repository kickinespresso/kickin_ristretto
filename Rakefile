require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'kickin_ristretto'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
path = File.expand_path(__dir__)
Dir.glob("#{path}/lib/tasks/**/*.rake").each { |f| import f }
