class CreateJoinTableCarreteServicio < ActiveRecord::Migration[5.2]
  def change
    create_join_table :carretes, :servicios do |t|
      # t.index [:carrete_id, :servicio_id]
      # t.index [:servicio_id, :carrete_id]
    end
  end
end
