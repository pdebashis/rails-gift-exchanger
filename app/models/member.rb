class Member < ApplicationRecord
  belongs_to :exchange
  belongs_to :user, optional: true
  validates_uniqueness_of :email, message: "is already added"

end
