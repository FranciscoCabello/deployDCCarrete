class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.integer :carrete_id
      t.integer :bet

      t.timestamps
    end
  end
end
