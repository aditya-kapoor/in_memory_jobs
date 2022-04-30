### Ruby implementation of an in memory job queue

A super simplified abstraction of Sidekiq/ActiveJob to allow the jobs to run in memory. This uses the ruby threads and Observable module which is only available in the ruby version greater than 3.

Steps to run:

1. Download and install the latest ruby 3 version. You can do it any popular ruby version managers out there.
2. run `ruby run.rb`.


In order to see good results for concurrency, I think you should first enqueue all the jobs in the queue first and then start them all at once to actual see concurrency happening.
