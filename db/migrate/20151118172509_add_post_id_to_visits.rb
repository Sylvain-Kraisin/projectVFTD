class AddPostIdToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :post_id, :integer
  end
end
