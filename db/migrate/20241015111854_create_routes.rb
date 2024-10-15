class CreateRoutes < ActiveRecord::Migration[7.2]
  def change
    create_table :routes do |t|
      t.references :facility, null: false, foreign_key: true
      t.float :current_lat
      t.float :current_long

      t.timestamps
    end
  end
end
