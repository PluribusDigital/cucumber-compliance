require 'rake'
require 'parallel'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:attorney_plus) do |task|
  ENV['CONFIG_NAME'] ||= "attorney_plus"
  task.cucumber_opts = ['--format=pretty', 'features/attorney_plus.feature', '-f json -o ./reports/results.json']
end

task :default => :attorney_plus

Cucumber::Rake::Task.new(:local) do |task|
  task.cucumber_opts = ['--format=pretty', 'features/attorney_plus.feature', 'CONFIG_NAME=local']
end

Cucumber::Rake::Task.new(:dev) do |task|
    task.cucumber_opts = ['--format=pretty', 'features/attorney_plus.feature', 'CONFIG_NAME=dev', '-f json -o ./reports/results.json']
end

task :parallel do |t, args|
  @num_parallel = 4

  Parallel.map([*1..@num_parallel], :in_processes => @num_parallel) do |task_id|
    ENV["TASK_ID"] = (task_id - 1).to_s
    ENV['name'] = "parallel_test"
    ENV['CONFIG_NAME'] = "parallel"

    Rake::Task["attorney_plus"].invoke
    Rake::Task["attorney_plus"].reenable
  end
end


task :test do |t, args|
  Rake::Task["attorney_plus"].invoke
  Rake::Task["attorney_plus"].reenable
  Rake::Task["local"].invoke
  Rake::Task["parallel"].invoke
end
