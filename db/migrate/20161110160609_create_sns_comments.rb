class CreateSnsComments < ActiveRecord::Migration
  def change
    create_table :sns_comments do |t|
      t.references :family, index: true
      t.references :family_post, index: true
      t.references :user, index: true

      t.timestamps null: false
      t.index [:family_id, :family_post_id, :user_id]
    end
  end
end
