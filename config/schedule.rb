# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# Schedule script for using Whenever toghether with rbenv
#
#   Whenever: https://github.com/javan/whenever
#   rbenv:    https://github.com/sstephenson/rbenv

# Schedule script for using Whenever toghether with rbenv
#
#   Whenever: https://github.com/javan/whenever
#   rbenv:    https://github.com/sstephenson/rbenv

set :env_path,    '"/home/koan_dev/.rbenv/shims":"/home/koan_dev/.rbenv/bin"'

# doesn't need modifications
# job_type :command, ":task :output"

# job_type :rake,   %q{ cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bundle exec rake :task --silent :output }
job_type :runner, %q{ cd :path && PATH=:env_path:"$PATH" bin/rails runner -e :environment ':task' :output }
# job_type :script, %q{ cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bundle exec script/:task :output }

# tasks
every :wednesday, :at => '1pm' do
  runner "Post.validated.order('created_at ASC').first.try(:publish!)"
end

every 1.minute do
  runner "User.last.update female:true"
end
