class AddCodeToCarrete < ActiveRecord::Migration[5.2]
  def change
    add_column :carretes, :code, :string
  end
end
