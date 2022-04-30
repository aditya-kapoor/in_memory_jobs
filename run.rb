require_relative 'echo_job'

50.times do |index|
  echo_job = EchoJob.new
  echo_job.perform_later({
    sleep_time: 3,
    message: "Hello from job #{index}"
  })
end

100.times do |index|
  RandomJob.new.perform_later
end

100.times do |index|
  AdditionJob.new.perform_later(a: index, b: index + 1)
end

# uncomment these lines to see the actual jobs running simultanouesly
Job::Base._queue.start_jobs
