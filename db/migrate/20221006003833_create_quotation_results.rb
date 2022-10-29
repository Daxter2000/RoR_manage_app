class CreateQuotationResults < ActiveRecord::Migration[5.1]
  def change
    create_table :quotation_results do |t|
      t.references :client_appointment_products, :foreign_key => {on_update: :cascade, on_delete: :cascade}
      t.references :general_status, :foreign_key => {on_update: :cascade}
      t.string :file
      t.float :quantity, :default => 0
      t.float :subtotal, :default => 0
      t.float :total, :default => 0
      t.timestamps
    end
  end
end
