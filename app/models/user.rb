class User < ApplicationRecord

  def self.from_omniauth(auth)
    where(auth.slice("uid", "name", "us_email")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.us_email = auth["info"]["email"]
    end
  end

end
