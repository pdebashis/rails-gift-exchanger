class Subscriber < ApplicationRecord
  before_validation :strip_whitespace
  validates :sub_email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please enter a valid email address"}

  def strip_whitespace
    self.sub_email = self.sub_email.strip unless self.sub_email.nil?
  end
end
