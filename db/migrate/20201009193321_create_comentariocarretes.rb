class CreateComentariocarretes < ActiveRecord::Migration[5.2]
  def change
    create_table :comentariocarretes do |t|
      t.integer :user
      t.text :comentario
      t.integer :carrete

      t.timestamps
    end
  end
end
