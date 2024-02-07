namespace :report do
  desc 'Generate the report to the new users in this week'
  task generate: :environment do
    one_week_ago = Time.now - 1.week
    users = User.where("last_login_at >= ?", one_week_ago)

    users.each do |user|
      puts "Name: #{user.name}, Email: #{user.email}, Last Login: #{user.last_login_at}"
    end
  end
end