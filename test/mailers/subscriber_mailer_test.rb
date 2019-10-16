require 'test_helper'


class SubscriberMailerTest < ActionMailer::TestCase

  setup do
    @subscriber = subscribers(:one)
  end
	
  test "subscription_confirmation" do
    mail = SubscriberMailer.subscription_confirmation(@subscriber)
    assert_equal "Rails Gift Exchanger Updates Subscription", mail.subject
    assert_equal ["no-reply-here@giftexchange.com"], mail.from
    assert_match "Thank You for subscribing", mail.body.encoded
  end

end
