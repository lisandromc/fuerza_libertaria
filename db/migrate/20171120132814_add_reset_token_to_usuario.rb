class AddResetTokenToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :reset_token, :string
    add_column :usuarios, :reset_token_expire, :datetime
  end
end
