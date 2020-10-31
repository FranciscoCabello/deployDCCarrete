class AddComunaToCarretes < ActiveRecord::Migration[5.2]
  def change
    add_column :carretes, :comuna, :string
  end
end
