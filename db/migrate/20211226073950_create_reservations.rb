class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :member,null: false
      t.references :schedule,null: false
      t.string :payment
      t.integer :chiket_sheets
      t.integer :total_sheets
      t.datetime :confirm_time, null: false
      t.integer :status,null: false
      t.timestamps
    end
  end
end
