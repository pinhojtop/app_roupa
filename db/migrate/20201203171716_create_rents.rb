class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.date :begin_date
      t.date :final_date
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
