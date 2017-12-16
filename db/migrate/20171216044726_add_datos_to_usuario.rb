class AddDatosToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :usuario_slack, :string
    add_column :usuarios, :perfil_facebook, :string
  end
end
