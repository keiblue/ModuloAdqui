class AddReferencesToOrderHistory < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_histories, :user, foreign_key: true , default: 1
    add_reference :order_histories, :orden, foreign_key: true , default: 1
    add_reference :order_histories, :status, foreign_key: true , default: 1
  end
end
