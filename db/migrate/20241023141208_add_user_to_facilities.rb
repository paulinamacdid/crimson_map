class AddUserToFacilities < ActiveRecord::Migration[7.2]
  def change
    add_reference :facilities, :user, foreign_key: true
  end
end
