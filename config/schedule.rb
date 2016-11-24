# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
set :environment, "development"
set :output, " /home/spondon/work/syncidlabs/nex/log/cron_log.log"
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
every 1.minutes do
  runner "TimedTask.timed_jobs('instant')"
end 

every 1.day do
	runner "TimedTask.timed_jobs('day')"
end

every 1.week do
	runner "TimedTask.timed_jobs('week')"
end

every 1.month do
  runner "TimedTask.timed_jobs('month')"
end