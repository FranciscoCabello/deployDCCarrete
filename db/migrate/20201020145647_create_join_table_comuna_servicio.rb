class CreateJoinTableComunaServicio < ActiveRecord::Migration[5.2]
  def change
    create_join_table :comunas, :servicios do |t|
      # t.index [:comuna_id, :servicio_id]
      # t.index [:servicio_id, :comuna_id]
    end
  end
end
