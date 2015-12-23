class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :user_username
      t.integer :video_id
      t.string :video_title
      t.string :question_1
      t.string :reponse_1
      t.string :answer_1
      t.string :question_2
      t.string :reponse_2
      t.string :answer_2
      t.string :question_3
      t.string :reponse_3
      t.string :answer_3
      t.string :question_4
      t.string :reponse_4
      t.string :answer_4
      t.integer :note
      t.boolean :done

      t.timestamps null: false
    end
  end
end
