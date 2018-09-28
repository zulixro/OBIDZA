class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.date :date_from
      t.date :date_to

      t.timestamps
    end
  end
end
