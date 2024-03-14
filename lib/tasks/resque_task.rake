require 'resque/tasks'

namespace :resque_task do
  task resque_setup: :environment do
    10.times do |i|
      puts "index #{i}"
    end
  end
end
