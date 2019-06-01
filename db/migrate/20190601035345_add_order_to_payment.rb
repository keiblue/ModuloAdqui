class AddOrderToPayment < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :order, foreign_key: true, default: 1
  end
end
