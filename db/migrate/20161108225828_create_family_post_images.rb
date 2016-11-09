class CreateFamilyPostImages < ActiveRecord::Migration
  def change
    create_table :family_post_images do |t|
      t.integer :family_post_id
      t.text :image

      t.timestamps null: false
      t.index [:family_post_id, :created_at]
    end
  end
end
