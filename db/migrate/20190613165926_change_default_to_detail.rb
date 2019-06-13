class ChangeDefaultToDetail < ActiveRecord::Migration[5.2]
  def change
    change_column :details, :count, :integer, default: 0 
  end
end
