class RenameTypeToOfferType < ActiveRecord::Migration[6.0]
  def change
    rename_column :offers, :type, :offerType
  end
end
