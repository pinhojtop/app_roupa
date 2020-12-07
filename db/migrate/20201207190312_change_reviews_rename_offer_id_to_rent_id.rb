class ChangeReviewsRenameOfferIdToRentId < ActiveRecord::Migration[6.0]
  def change
    change_table :reviews do |t|
      t.rename :offer_id, :rent_id
    end
  end
end
