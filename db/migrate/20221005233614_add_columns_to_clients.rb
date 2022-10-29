class AddColumnsToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :calle, :string
    add_column :clients, :colonia, :string
    add_column :clients, :numero, :int
    add_column :clients, :referencias, :string 
    add_column :clients, :notas, :text   
  end
end
