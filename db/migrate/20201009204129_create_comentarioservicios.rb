class CreateComentarioservicios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarioservicios do |t|
      t.integer :user
      t.text :comentario
      t.integer :servicio

      t.timestamps
    end
  end
end
