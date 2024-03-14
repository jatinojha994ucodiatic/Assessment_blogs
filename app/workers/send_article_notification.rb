class SendArticleNotification < ApplicationJob
  queue_as :articles_queue

  def perform(article_id)
    ArticleMailer.send_article_notification(article_id).deliver_now
    puts "Email sending..."
  end
end