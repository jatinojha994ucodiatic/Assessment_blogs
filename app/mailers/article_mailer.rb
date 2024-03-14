class ArticleMailer < ActionMailer::Base
  after_deliver :say_goodbye
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.send_article_notification.subject
  #
  def send_article_notification(article_id)
    @greeting = "Hi"
    @article = Article.find(article_id)
    @user = User.find(@article.user_id)
    mail(
      to: @user.email,
      subject: "Article #{@article.title} Created recently"
    )
  end

  private
    def say_goodbye
      puts "Goodbye mail has been sent..."
    end
end
