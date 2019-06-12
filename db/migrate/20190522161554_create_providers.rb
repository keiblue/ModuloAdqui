class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.integer :rut
      t.string :rut_dv , limit:1

      t.timestamps
    end
  end
end
