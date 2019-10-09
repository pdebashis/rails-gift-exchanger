class RemoveUsEmailFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :us_email, :string
  end
end
