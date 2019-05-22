class SetUniqueRut < ActiveRecord::Migration[5.2]
  def up
    change_column :providers, :rut, :integer, unique: true 
  end
  def down 
    change_column :providers, :rut, :integer, unique: false
    
  end
end
