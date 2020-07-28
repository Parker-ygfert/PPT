class AddBornDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :born_date, :date
  end
end
