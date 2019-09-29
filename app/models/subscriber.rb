class Subscriber < ApplicationRecord
  validates :sub_email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please enter a valid email address"}
end
