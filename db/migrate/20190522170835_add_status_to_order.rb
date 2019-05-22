class AddStatusToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :status, foreign_key: true, default: 1
    #Ex:- :default =>''
  end
end
