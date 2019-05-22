class AddAddressToProvider < ActiveRecord::Migration[5.2]
  def change
    add_reference :providers, :address, foreign_key: true,default:1
  end
end
