class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :color
      t.string :token
      t.integer :game_id
      t.integer :money

      t.timestamps null: false
    end
  end
end
