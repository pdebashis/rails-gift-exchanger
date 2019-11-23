class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :email
      t.boolean :confirmed
      t.string :gift_to
      t.string :gift_from
      t.references :exchange, null: false, foreign_key: true

      t.timestamps
    end
  end
end
