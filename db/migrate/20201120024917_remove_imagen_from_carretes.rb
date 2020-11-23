class RemoveImagenFromCarretes < ActiveRecord::Migration[5.2]
  def change
    remove_column :carretes, :imagen, :string
  end
end
