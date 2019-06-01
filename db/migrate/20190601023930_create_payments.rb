class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :method
      t.integer :date

      t.timestamps
    end
  end
end
