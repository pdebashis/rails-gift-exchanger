class User < ApplicationRecord

  def self.from_omniauth(auth)
    where(auth.slice("uid", "name", "us_email")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.us_email = auth["info"]["email"]

      exist_subscriber = Subscriber.find_by(sub_email: user.us_email)
      exist_subscriber.delete
      Subscriber.new({:subscribed => true, :type_of_sub=> "Sign in Subscriber",:sub_email => user.us_email}).save
    end
  end

end