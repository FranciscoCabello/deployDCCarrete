class RemoveImagenFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :imagen, :string
  end
end
