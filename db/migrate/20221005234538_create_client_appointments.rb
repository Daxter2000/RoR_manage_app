class CreateClientAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :client_appointments do |t|
      t.date :appointment_date
      t.time :appointment_hour
      t.references :client, :foreign_key => {on_update: :cascade, on_delete: :cascade}
      t.timestamps
    end
  end
end
