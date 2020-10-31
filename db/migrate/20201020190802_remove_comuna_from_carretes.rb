class RemoveComunaFromCarretes < ActiveRecord::Migration[5.2]
  def change
    remove_column :carretes, :comuna, :integer
  end
end
