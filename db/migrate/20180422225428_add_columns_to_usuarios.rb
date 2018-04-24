class AddColumnsToUsuarios < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :provincia_id, :integer, { null: true }
    add_column :usuarios, :fecha_nacimiento, :date, { null: true }
    add_column :usuarios, :perfil_instagram, :string, { null: true }
    add_column :usuarios, :perfil_twitter, :string, { null: true }
  end
end
