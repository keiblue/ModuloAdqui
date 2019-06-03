class DeleteColumnItemsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :count, :int
  end
end
