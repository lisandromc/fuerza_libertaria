class AddOpcionesMapaToUsuario < ActiveRecord::Migration[5.1]
  def up
    add_column :usuarios, :nombre_publico, :boolean
    add_column :usuarios, :email_publico, :boolean
    add_column :usuarios, :movil_publico, :boolean
    add_column :usuarios, :profesion_publico, :boolean
    add_column :usuarios, :areas_conocimiento_publico, :boolean
    add_column :usuarios, :usuario_slack_publico, :boolean
    add_column :usuarios, :perfil_facebook_publico, :boolean
    execute 'update usuarios set nombre_publico = 0, email_publico = 0, movil_publico = 0, profesion_publico = 0,' +
            'areas_conocimiento_publico = 0, usuario_slack_publico = 0, perfil_facebook_publico = 0'
    change_column :usuarios, :nombre_publico, :boolean, { null: false }
    change_column :usuarios, :email_publico, :boolean, { null: false }
    change_column :usuarios, :movil_publico, :boolean, { null: false }
    change_column :usuarios, :profesion_publico, :boolean, { null: false }
    change_column :usuarios, :areas_conocimiento_publico, :boolean, { null: false }
    change_column :usuarios, :usuario_slack_publico, :boolean, { null: false }
    change_column :usuarios, :perfil_facebook_publico, :boolean, { null: false }
  end

  def down
    remove_column :usuarios, :nombre_publico
    remove_column :usuarios, :email_publico
    remove_column :usuarios, :movil_publico
    remove_column :usuarios, :profesion_publico
    remove_column :usuarios, :areas_conocimiento_publico
    remove_column :usuarios, :usuario_slack_publico
    remove_column :usuarios, :perfil_facebook_publico
  end
end
