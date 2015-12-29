require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "correction" do
    mail = UserMailer.correction
    assert_equal "Correction", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
