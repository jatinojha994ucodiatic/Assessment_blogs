namespace :system_task do
  desc "TODO"
  task exec_cmd: :environment do
    command_to_run = "rails db:migrate:status"
    puts "Running command: #{command_to_run}"
    system(command_to_run)
  end

end

namespace :another_system_task do
  desc "Another system task"
  task exec_cmd: :environment do
    command_to_run = "uptime && rails s"
    puts "Running command: #{command_to_run}"
    system(command_to_run)
  end
end