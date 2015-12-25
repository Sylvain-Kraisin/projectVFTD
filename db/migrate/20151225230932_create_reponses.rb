class CreateReponses < ActiveRecord::Migration
  def change
    create_table :reponses do |t|
      t.integer :test_id
      t.string :user_username
      t.string :reponse_1
      t.string :reponse_2
      t.string :reponse_3
      t.string :reponse_4

      t.timestamps null: false
    end
  end
end
