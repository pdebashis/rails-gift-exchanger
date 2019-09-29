class CreateSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribers do |t|
      t.string :sub_email
      t.string :type_of_sub
      t.boolean :subscribed

      t.timestamps
    end
  end
end
