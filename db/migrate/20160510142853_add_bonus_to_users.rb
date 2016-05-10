class AddBonusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bonus, :integer, default: 0
  end
end
