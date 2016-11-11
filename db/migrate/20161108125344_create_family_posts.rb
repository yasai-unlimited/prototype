class CreateFamilyPosts < ActiveRecord::Migration
  def change
    create_table :family_posts do |t|
      t.references :family, index: true, foreign_key: true
      t.text :content
      t.integer :stars_count, default: 0

      t.timestamps null: false
      t.index [:family_id, :created_at]
    end
  end
end
