class Job
  class InlineRunner

    def initialize(capacity)
      @capacity = capacity
    end

    attr_reader :capacity

    def run_jobs(queue)
      while(queue.size > 0)
        puts "Queue Size: #{queue.size}"
        jobs = queue.pop(capacity)
        jobs.collect { |job| Thread.new { run_job(job[:klass], job[:args]) } }.collect(&:join)
      end
    end

    private

    def run_job(klass, args)
      # find the job by jid from the backend store.
      klass_class = Object.const_get(klass)
      klass_class.new.perform(args)
    end
  end
end
