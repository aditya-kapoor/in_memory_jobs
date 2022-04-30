require 'securerandom'
require_relative 'runner'

# Base core class where the runner and queue will be defined. The runner and queue classes can then be further
# made into their separate special classes handling complex abstractions.

class Job
  class Base
    @@_runner = nil
    @@_queue = nil

    attr_reader :jid

    def initialize
      @jid = SecureRandom.hex
    end

    def self._queue
      @@_queue
    end

    def self._runner
      @@_runner
    end

    def self.runner(runner_type, threads)
      @@_runner = Object.const_get("Job::#{runner_type.capitalize}Runner")
      @@_queue = Queue.new
      @@_queue.add_observer(@@_runner.new(threads), :run_jobs)
    end

    def perform_later(args = {})
      self.class._queue.push(self.class.name, jid, args)
    end
  end
end
