class AddContentToSnsComment < ActiveRecord::Migration
  def change
    add_column :sns_comments, :content, :text
  end
end
