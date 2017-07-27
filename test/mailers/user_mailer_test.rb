require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "action#send_password" do
    mail = UserMailer.action#send_password
    assert_equal "Action#send password", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
