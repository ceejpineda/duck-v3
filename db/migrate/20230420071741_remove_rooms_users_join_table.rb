class RemoveRoomsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :users_has_rooms
  end
end