class PlayersController < ApplicationController

	def new
		@game = Game.find(params[:game_id])
		@player = @game.players.new
	end

	def create
		@game = Game.find(params[:game_id])
		@player = Player.create player_params
		if @player.save
			@player.update_column(:game_id, @game)
			@player.update_column(:money, 1500)
			redirect_to root_path
		else
			render 'new'
		end
	end

	def change
		@player = Player.find(params[:id])
		@amount = params[:amount].to_i
		@text = @player.amount
		if params["+"]
			@text = 'attempted add'
			@player.update_column(:money, @player.money + @amount)
		end
		if params["-"]
			@player.update_column(:money, @player.money - @amount)
			@text = 'attempted subract'
		end
     	redirect_to :back
	end

	private

	def player_params
		params.require(:player).permit(:name)
	end
end
