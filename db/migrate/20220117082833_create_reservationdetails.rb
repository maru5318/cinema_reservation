class CreateReservationdetails < ActiveRecord::Migration[5.2]
  def change
    create_table :reservationdetails do |t|
      t.references :reservation,null: false
      t.references :ticket,null: false
      t.string :seat
      t.timestamps
    end
  end
end
