class AddNameToFacilities < ActiveRecord::Migration[7.2]
  def change
    add_column :facilities, :name, :string
  end
end
