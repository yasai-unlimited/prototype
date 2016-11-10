class CreateFamilyPostStars < ActiveRecord::Migration
  def change
    create_table :family_post_stars do |t|
      t.references :family, index: true
      t.references :family_post, index: true

      t.timestamps null: false
      t.index [:family_id, :family_post_id], unique: true
    end
  end
end
