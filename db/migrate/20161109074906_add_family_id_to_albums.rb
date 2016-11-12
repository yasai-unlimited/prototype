class AddFamilyIdToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :family_id, :integer
  end
end
