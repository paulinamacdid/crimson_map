class CreateFavourites < ActiveRecord::Migration[7.2]
  def change
    create_table :favourites do |t|
      t.boolean :used_before
      t.references :user, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
