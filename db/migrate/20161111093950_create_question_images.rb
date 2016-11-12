class CreateQuestionImages < ActiveRecord::Migration
  def change
    create_table :question_images do |t|
      t.references :question, index: true, foreign_key: true
      t.text :image

      t.timestamps null: false
    end
  end
end
