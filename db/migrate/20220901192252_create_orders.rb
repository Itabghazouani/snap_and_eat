class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.datetime :order_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
