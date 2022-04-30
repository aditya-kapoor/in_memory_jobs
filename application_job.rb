require_relative 'job'

class ApplicationJob < Job::Base
  runner :inline, 5
end
