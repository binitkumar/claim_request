class AddBlobFieldsToClaim < ActiveRecord::Migration[5.1]
  def change
    add_column :claims, :damage_room_overview_1, :binary
    add_column :claims, :details_of_damage_1, :binary
    add_column :claims, :damage_room_overview_2, :binary
    add_column :claims, :details_of_damage_2, :binary
  end
end
