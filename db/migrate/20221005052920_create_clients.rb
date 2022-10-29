class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :names
      t.string :ap_pat
      t.string :ap_mat
      t.string :tel
      t.string :channel
      t.references :company, :foreign_key => {on_update: :cascade, on_delete: :cascade}, null: false

      t.timestamps
    end
  end
end
