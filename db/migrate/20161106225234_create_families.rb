class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.boolean :friend_open, null: false, default: false
      t.boolean :general_open, null: false, default: false
      t.text :icon
      t.text :coverimage
      t.text :description
      t.string :title

      t.timestamps null: false
    end
  end
end
