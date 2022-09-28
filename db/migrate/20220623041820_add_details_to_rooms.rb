class AddDetailsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :room_name, :string
    add_column :rooms, :room_profile, :text
    add_column :rooms, :price, :integer
    add_column :rooms, :address, :string
    add_column :rooms, :room_image, :string
  end
end
