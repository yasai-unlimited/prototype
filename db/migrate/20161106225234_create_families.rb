class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name, null: false, default: '家族の名前'
      t.boolean :friend_open, null: false, default: false
      t.boolean :general_open, null: false, default: false
      t.text :icon
      t.text :coverimage
      t.text :description, default: '家族の一言説明文'
      t.string :title, default: '家族ページのタイトル'

      t.timestamps null: false
    end
  end
end
