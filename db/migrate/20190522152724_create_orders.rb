class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.date :estimated_delivery_date
      t.date :delivery_date

      t.timestamps
    end
  end
end
