class AdduserToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :user, foreign_key: true, default: 1
  end
end
