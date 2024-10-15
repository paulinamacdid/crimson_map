class CreateFacilities < ActiveRecord::Migration[7.2]
  def change
    create_table :facilities do |t|
      t.string :address
      t.boolean :business_owner
      t.float :rating
      t.integer :toilet
      t.boolean :sanitary_products
      t.boolean :baby_change
      t.boolean :quiet_place
      t.boolean :education
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
