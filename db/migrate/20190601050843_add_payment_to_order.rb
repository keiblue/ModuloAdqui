class AddPaymentToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :payment, foreign_key: true , default: 1
  end
end
