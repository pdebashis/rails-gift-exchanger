class AddUserToExchanges < ActiveRecord::Migration[6.0]
  def change
    add_reference :exchanges, :user, null: false, foreign_key: true
  end
end
