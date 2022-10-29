class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :RFC, unique: true
      t.string :adress, null: false
      t.string :logo, null: true

      t.timestamps
    end
  end
end
