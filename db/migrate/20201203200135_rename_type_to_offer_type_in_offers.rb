class RenameTypeToOfferTypeInOffers < ActiveRecord::Migration[6.0]
  def change
    rename_column :offers, :type, :offer_type
  end
end
