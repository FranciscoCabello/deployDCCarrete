class AddUserToServicio < ActiveRecord::Migration[5.2]
  def change
    add_reference :servicios, :user, foreign_key: true
  end
end
