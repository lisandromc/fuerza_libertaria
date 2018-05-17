class AddReferenteToUsuario < ActiveRecord::Migration[5.1]
  def up
    add_column :usuarios, :referente, :boolean
    execute 'update usuarios set referente = 0'
    change_column :usuarios, :referente, :boolean, null: false
  end

  def down
    remove_column :usuarios, :referente
  end
end
