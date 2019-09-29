require 'test_helper'

class SubscriberMailerTest < ActionMailer::TestCase
  test "subscription_confirmation" do
    mail = SubscriberMailer.subscription_confirmation
    assert_equal "Subscription confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
