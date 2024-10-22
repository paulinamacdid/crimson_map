class ChangeToiletDataInFacilities < ActiveRecord::Migration[7.2]
  def change
    change_column :facilities, :toilet, :boolean, using: "toilet::boolean"
  end
end
