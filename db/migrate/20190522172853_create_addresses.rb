class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :region
      t.string :comuna
      t.string :calle
      t.integer :numero
      t.text :comment

      t.timestamps
    end
  end
end
