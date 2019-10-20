class SubscriberMailer < ApplicationMailer
  default from: "no-reply-here@giftexchange.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.subscription_confirmation.subject
  #
  def subscription_confirmation(subscriber,unsubscribe)
    @subscriber = subscriber
    @unsubscribe = unsubscribe

    mail to: @subscriber.sub_email, subject: "Rails Gift Exchanger Updates Subscription"
  end
end
