class User < ApplicationRecord
  include Clearance::User
  has_many :members, dependent: :destroy
  after_save :insert_subscriber_table

  def insert_subscriber_table
    @subscriber = Subscriber.find_by({:sub_email => self.email})

    unless @subscriber
    	Subscriber.new({:subscribed => true, :type_of_sub=> "Sign In Subscriber",:sub_email => self.email}).save
    end
  end

end