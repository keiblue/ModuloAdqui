class AddServiceToProvider < ActiveRecord::Migration[5.2]
  def change
    add_reference :providers, :service, foreign_key: true, default: 1
  end
end
