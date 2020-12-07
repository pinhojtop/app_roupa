class AddForeignKeyReviewsToRents < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :reviews, :offers
    add_foreign_key :reviews, :rents
  end
end
