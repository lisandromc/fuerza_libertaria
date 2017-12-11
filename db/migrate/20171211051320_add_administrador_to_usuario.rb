class AddAdministradorToUsuario < ActiveRecord::Migration[5.1]
  def up
    add_column :usuarios, :administrador, :boolean
    execute 'update usuarios set administrador = 0'
    change_column :usuarios, :administrador, :boolean, null: false
  end

  def down
    remove_column :usuarios, :administrador
  end
end
