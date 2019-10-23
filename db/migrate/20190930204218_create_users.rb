class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :is_admin, default: false, null: false
      t.text :interests
      t.text :books
      t.text :movies
      t.timestamps
    end
  end
end
