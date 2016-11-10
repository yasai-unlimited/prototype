class AddFamilyIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :family_id, :integer
  end
end
