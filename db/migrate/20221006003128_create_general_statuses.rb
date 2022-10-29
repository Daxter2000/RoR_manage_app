class CreateGeneralStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :general_statuses do |t|
      t.integer :status, :default => 0
      t.string :description
      t.timestamps
    end
  end
end
