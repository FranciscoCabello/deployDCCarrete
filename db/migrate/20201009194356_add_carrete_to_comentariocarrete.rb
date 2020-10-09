class AddCarreteToComentariocarrete < ActiveRecord::Migration[5.2]
  def change
    add_reference :comentariocarretes, :carrete, foreign_key: true
  end
end
