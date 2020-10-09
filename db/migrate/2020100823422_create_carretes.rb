class CreateCarretes < ActiveRecord::Migration[5.2]
  def change
    create_table :carretes do |t|
      t.string :titulo
      t.text :descripcion
      t.string :direccion
      t.integer :capacidad
      t.integer :costo
      t.integer :estado
      t.string :imagen
      t.integer :user

      t.timestamps
    end
  end
end
