class CreateClientProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :client_projects do |t|
      t.references  :quotation_result, :foreign_key => {on_update: :cascade, on_delete: :cascade}
      t.references  :general_status, :foreign_key => {on_update: :cascade, on_delete: :cascade}
      t.float :advance, :default => 0
      t.string :stage 
      t.datetime :forecast_start_date
      t.datetime :forecast_finish_date
      t.datetime :start_date
      t.datetime :finish_date
      t.string :file
      t.timestamps
    end
  end
end
