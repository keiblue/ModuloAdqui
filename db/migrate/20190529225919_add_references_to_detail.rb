class AddReferencesToDetail < ActiveRecord::Migration[5.2]
  def change
    add_reference :details, :item, foreign_key: true , default: 1
    add_reference :details, :order, foreign_key: true, default: 1
  end
end
