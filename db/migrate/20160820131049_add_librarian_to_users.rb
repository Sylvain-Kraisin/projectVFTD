class AddLibrarianToUsers < ActiveRecord::Migration
  def change
    add_column :users, :librarian, :boolean, default: false
  end
end
