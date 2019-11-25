class AddReceivedShippedToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :received, :boolean
    add_column :members, :shipped, :boolean
  end
end
