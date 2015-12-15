class CreateConsoles < ActiveRecord::Migration
  def change
    create_table :consoles do |t|
      t.string :title
      t.boolean :unlock

      t.timestamps null: false
    end
  end
end
