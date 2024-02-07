namespace :example_task do
  desc 'Greeting message task'

  task greet_the_user: :environment do
    puts "Hello greeting from the example task..."
  end

  task welcome_mail: :environment do
    User.all.each do |user|
      WelcomeMailer.welcome_email(user).deliver_now
    end
  end
end