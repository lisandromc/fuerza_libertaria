class AddCoordinadorToUsuario < ActiveRecord::Migration[5.1]
  def up
    add_column :usuarios, :coordinador, :boolean
    execute 'update usuarios set coordinador = 0'
    change_column :usuarios, :coordinador, :boolean, null: false
  end

  def down
    remove_column :usuarios, :coordinador
  end
end
