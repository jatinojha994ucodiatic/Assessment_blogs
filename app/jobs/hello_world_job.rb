class HelloWorldJob < ApplicationJob
  queue_as :articles_queue

  def perform(*args)
    puts "Runinignthe current job..."
  end
end
