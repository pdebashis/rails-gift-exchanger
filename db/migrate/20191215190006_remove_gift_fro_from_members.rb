class RemoveGiftFroFromMembers < ActiveRecord::Migration[6.0]
  def change

    remove_column :members, :gift_from, :string
  end
end
