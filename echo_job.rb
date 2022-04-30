require_relative 'application_job'

class EchoJob < ApplicationJob
  def perform(args)
    args ||= {}
    sleep_time = args[:sleep_time]&.to_i || 0
    puts "#{Time.now} Start: jid(#{self.jid}), sleep: #{sleep_time}, message: #{args[:message] || "message not available"}"
    sleep sleep_time
  end
end

class AdditionJob < ApplicationJob
  def perform(args)
    args ||= {}
    puts "#{Time.now} Start: jid(#{self.jid}), message: AdditionJob: #{args[:a] + args[:b]}"
  end
end

class RandomJob < ApplicationJob
  def perform(args={})
    puts "#{Time.now} Start: jid(#{self.jid}), message: RandomJob"
  end
end
