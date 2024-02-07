namespace :active_record_counter do
  desc "TODO"
  task :year_quarter, [:year, :qtr] => :environment do |t, args|
    puts "Year: #{args[:year]}"
    puts "Qtr: #{args[:qtr]}"
  end

end
# namespace :active_record_counter do
#   desc "TODO"
#   task articles_count: :environment do
#     puts "Articles Count = #{Article.count}"
#   end

#   desc "TODO"
#   task comments_count: :environment do
#     puts "Comments Count = #{Comment.count}"
#   end

# end
