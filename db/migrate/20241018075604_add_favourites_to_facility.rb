class AddFavouritesToFacility < ActiveRecord::Migration[7.2]
  def change
    add_column :facilities, :favourite, :boolean
  end
end
