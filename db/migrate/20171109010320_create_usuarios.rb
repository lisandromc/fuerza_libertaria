class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :nombre, null: false
      t.string :domicilio
      t.string :localidad
      t.string :movil
      t.string :profesion
      t.string :areas_conocimiento
      t.float :latitude
      t.float :longitude
      t.boolean :activo_mapa_liberal, null: false
      t.timestamps null: false
    end

    add_index :usuarios, :nombre
    add_index :usuarios, :email, unique: true
  end
end
