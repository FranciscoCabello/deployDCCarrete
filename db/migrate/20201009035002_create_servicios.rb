class CreateServicios < ActiveRecord::Migration[5.2]
  def change
    create_table :servicios do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :capacidad
      t.integer :costo
      t.float :valoracion
      t.string :imagen
      t.string :categoria
      t.integer :user

      t.timestamps
    end
  end
end
