class AddMailsChoiceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mail_correction, :boolean, default: true
    add_column :users, :mail_new_test, :boolean, default: true
    add_column :users, :mail_new_post, :boolean, default: true
  end
end
