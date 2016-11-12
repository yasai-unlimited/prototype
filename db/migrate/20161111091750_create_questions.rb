class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content, null: false
      t.boolean :general_open
      t.boolean :friend_open
      t.boolean :family_open
      t.references :family, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
      t.index [:family_id, :user_id, :created_at]
    end
  end
end
