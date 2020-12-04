class AddColumnstoUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
  end
end
