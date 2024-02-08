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

  task redis_cache: :environment do
    Rails.cache.write('my_key', "#thisvalue")
    value = Rails.cache.read('my_key')
    puts "my_key#{value}"
  end

  task redis_ex: :environment do
    puts Rails.cache.write 'word_of_the_day', expires_in: 5.seconds do
      %w[:jatin :ojha :svp :mp :india]
    end
    # puts "word_of_the_day = #{Rails.cache.fetch 'word_of_the_day'}"
  end

  task fetch_env: :environment do
    puts "REDIS_CACHE_URL: #{ENV.fetch('REDIS_CACHE_URL')}"
    puts "DOMAIN_NAME: #{ENV.fetch('DOMAIN_NAME')}"
  end
end