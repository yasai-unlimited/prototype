class CreateFamilyRelationships < ActiveRecord::Migration
  def change
    create_table :family_relationships do |t|
      t.references :follow, index: true
      t.references :follower, index: true

      t.timestamps null: false
      t.index [:follow_id, :follower_id], unique: true
    end
  end
end
