class AddAprobadoToServicio < ActiveRecord::Migration[5.2]
  def change
    add_column :servicios, :aprobado, :integer
  end
end
