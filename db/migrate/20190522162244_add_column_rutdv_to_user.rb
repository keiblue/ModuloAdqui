class AddColumnRutdvToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rutito_dv, :string, default: '1',limit: 1
  end
end
