class AddAverageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :average, :float
  end
end
