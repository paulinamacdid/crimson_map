class AddColumnsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :health_issues, :string
    add_column :users, :current_long, :float
    add_column :users, :current_lat, :float
  end
end
