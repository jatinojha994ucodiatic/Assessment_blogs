require "test_helper"

class ArticleMailerTest < ActionMailer::TestCase
  test "send_article_notification" do
    mail = ArticleMailer.send_article_notification
    assert_equal "Send article notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
