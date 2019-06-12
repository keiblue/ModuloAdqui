class AddAddressToStore < ActiveRecord::Migration[5.2]
  def change
    add_reference  :stores, :address, foreign_key: true, default:1
  end
end
