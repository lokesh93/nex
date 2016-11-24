json.array!(@timed_tasks) do |timed_task|
  json.extract! timed_task, :id, :interval, :measure_of_time
  json.url timed_task_url(timed_task, format: :json)
end
