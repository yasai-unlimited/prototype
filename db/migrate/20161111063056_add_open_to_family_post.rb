class AddOpenToFamilyPost < ActiveRecord::Migration
  def change
    add_column :family_posts, :friend_open, :boolean, default: false
    add_column :family_posts, :general_open, :boolean, default: false
  end
end
