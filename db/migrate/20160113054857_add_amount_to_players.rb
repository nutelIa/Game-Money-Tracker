class AddAmountToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :amount, :string
  end
end
