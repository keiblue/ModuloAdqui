class AddStoreToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :store, foreign_key: true, default:1
  end
end
