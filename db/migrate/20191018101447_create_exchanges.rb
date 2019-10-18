class CreateExchanges < ActiveRecord::Migration[6.0]
  def change
    create_table :exchanges do |t|
      t.string :title
      t.date :date_of_gifting
      t.date :finish_date
      t.date :date_of_matching

      t.timestamps
    end
  end
end
