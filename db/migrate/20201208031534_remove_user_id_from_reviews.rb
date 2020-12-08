class RemoveUserIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :reviews, :users
    remove_column :reviews, :user_id
  end
end
