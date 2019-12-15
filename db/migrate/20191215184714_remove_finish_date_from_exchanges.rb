class RemoveFinishDateFromExchanges < ActiveRecord::Migration[6.0]
  def change

    remove_column :exchanges, :finish_date, :date
  end
end
