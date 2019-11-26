class AddDefaultValueToShowAttribute < ActiveRecord::Migration[6.0]
  def change
    change_column :members, :confirmed, :boolean, default: false
    change_column :members, :received, :boolean, default: false
    change_column :members, :shipped, :boolean, default: false
  end
end
