class CreateJoinTableUserCarrete < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :carretes do |t|
      # t.index [:user_id, :carrete_id]
      # t.index [:carrete_id, :user_id]
    end
  end
end
