class AddReferencesToOrderHistory < ActiveRecord::Migration[5.2]
  def down
    remove_reference :order_histories, :user, foreign_key: false , default: 1
    remove_reference :order_histories, :orden, foreign_key: false , default: 1
    remove_reference :order_histories, :status, foreign_key: false , default: 1
  end
  def up
    add_reference :order_histories, :user, foreign_key: false , default: 1
    add_reference :order_histories, :order, foreign_key: false , default: 1
    add_reference :order_histories, :status, foreign_key: false , default: 1
  end
end
