require "observer"

class Job
  class Queue
    include Observable

    attr_accessor :jobs

    def initialize
      @jobs = []
    end

    def push(klass, jid, args)
      jobs.push({klass: klass, jid: jid, args: args})
      changed(true)
    end

    def start_jobs
      notify_observers(jobs)
    end
  end
end
