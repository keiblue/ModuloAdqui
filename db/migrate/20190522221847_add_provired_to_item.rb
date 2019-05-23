class AddProviredToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference   :items, :provider, foreign_key: true, default: 1

  end
end
