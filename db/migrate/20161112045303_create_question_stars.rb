class CreateQuestionStars < ActiveRecord::Migration
  def change
    create_table :question_stars do |t|
      t.references :question, index: true, foreign_key: true
      t.references :family, index: true, foreign_key: true

      t.timestamps null: false
      t.index [:question_id, :family_id], unique: true
    end
  end
end
