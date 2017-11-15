class AddDniToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :dni, :integer
  end
end
