class SubscriberMailer < ApplicationMailer
  default from: "no-reply-here@giftexchange.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.subscription_confirmation.subject
  #
  def subscription_confirmation(subscriber)
    @subscriber = subscriber

    mail to: @subscriber.sub_email, subject: "Rails Gift Exchanger Project Sign Up Confirmation"
  end
end
