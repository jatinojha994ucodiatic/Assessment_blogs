class SendEmailJob < ApplicationJob
  # queue_as :default
  self.queue_adapter = :resque

  def perform(*args)
    args.first.times do
      puts "Running jobs infinite"
    end
  end
end
