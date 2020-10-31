class AddAprobadoToCarrete < ActiveRecord::Migration[5.2]
  def change
    add_column :carretes, :aprobado, :integer
  end
end
