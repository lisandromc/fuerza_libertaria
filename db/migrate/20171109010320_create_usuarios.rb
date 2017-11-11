class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.string :nombre, null: false
      t.string :domicilio
      t.string :localidad
      t.string :movil
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end

    add_index :usuarios, :email
    add_index :usuarios, :remember_token
  end
end
