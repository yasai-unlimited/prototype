class AddAlbumIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :album_id, :integer
  end
end
