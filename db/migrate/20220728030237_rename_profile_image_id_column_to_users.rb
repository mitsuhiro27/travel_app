class RenameProfileImageIdColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :profile_image_id, :avater
  end
end
