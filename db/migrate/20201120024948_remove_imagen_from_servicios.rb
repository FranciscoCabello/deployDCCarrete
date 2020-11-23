class RemoveImagenFromServicios < ActiveRecord::Migration[5.2]
  def change
    remove_column :servicios, :imagen, :string
  end
end
