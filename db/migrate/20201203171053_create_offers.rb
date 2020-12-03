class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :size
      t.string :gender
      t.string :style
      t.float :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
