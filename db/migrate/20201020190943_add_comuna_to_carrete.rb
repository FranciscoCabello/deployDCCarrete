class AddComunaToCarrete < ActiveRecord::Migration[5.2]
  def change
    add_reference :carretes, :comuna, foreign_key: true
  end
end
