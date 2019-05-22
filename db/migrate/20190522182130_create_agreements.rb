class CreateAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :agreements do |t|
      t.integer :code
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
