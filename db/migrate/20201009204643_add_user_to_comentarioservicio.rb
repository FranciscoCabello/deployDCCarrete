class AddUserToComentarioservicio < ActiveRecord::Migration[5.2]
  def change
    add_reference :comentarioservicios, :user, foreign_key: true
  end
end
