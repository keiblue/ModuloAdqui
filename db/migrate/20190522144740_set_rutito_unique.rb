class SetRutitoUnique < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :rutito, :integer, unique: true 
  end
  def down 
    change_column :users, :rutito, :integer, unique: false
    
  end
end
