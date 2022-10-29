class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description
      t.float :unit_price, :default => 0
      t.float :unit, :default => 0
      t.references :company, :foreign_key => {on_update: :cascade, on_delete: :cascade}
      t.string :model 

      t.timestamps
    end
  end
end
