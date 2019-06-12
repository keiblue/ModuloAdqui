class AddStoreToInventary < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventaries, :store, foreign_key: true,default:1
  end
end
