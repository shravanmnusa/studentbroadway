require 'test_helper'

class SbuserMailerTest < ActionMailer::TestCase
  test "sbuser_activate" do
    mail = SbuserMailer.sbuser_activate
    assert_equal "Sbuser activate", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "password_reset" do
    mail = SbuserMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
