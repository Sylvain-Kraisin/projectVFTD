class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :newsletter, :boolean, default: true
    add_column :users, :birthdate, :date
    add_column :users, :female, :boolean, default: false
  end
end
