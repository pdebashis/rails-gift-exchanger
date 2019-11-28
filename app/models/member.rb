class Member < ApplicationRecord
  belongs_to :exchange
  belongs_to :user, optional: true
  validates :email , uniqueness: {scope: :exchange_id}

end
