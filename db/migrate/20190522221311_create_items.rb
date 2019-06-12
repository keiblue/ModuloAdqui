class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :nombre
      t.integer :precio
      t.integer :count

      t.timestamps
    end
  end
end
