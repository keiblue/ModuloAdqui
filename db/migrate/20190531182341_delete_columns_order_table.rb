class DeleteColumnsOrderTable < ActiveRecord::Migration[5.2]
  def change
      remove_column :orders, :order_date, :date
      remove_column :orders, :estimated_delivery_date, :date
      remove_column :orders, :delivery_date, :date
  end
end
