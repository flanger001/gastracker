class AddDefaultToUserStationFavorite < ActiveRecord::Migration[5.2]
  def change
    change_column_default :user_stations, :favorite, from: false, to: true
  end
end
