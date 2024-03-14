# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/article_mailer/send_article_notification
  def send_article_notification
    ArticleMailer.send_article_notification
  end

end
