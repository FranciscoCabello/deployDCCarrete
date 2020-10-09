class AddServicioToComentarioservicio < ActiveRecord::Migration[5.2]
  def change
    add_reference :comentarioservicios, :servicio, foreign_key: true
  end
end
