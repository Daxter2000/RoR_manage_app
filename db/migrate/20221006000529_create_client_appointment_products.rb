class CreateClientAppointmentProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :client_appointment_products do |t|
      t.references :product, :foreign_key => {on_update: :cascade, on_delete: :cascade},:null => false
      t.references :client_appointment, :foreign_key => {on_update: :cascade, on_delete: :cascade}, :null => false
      t.timestamps
    end
  end
end
