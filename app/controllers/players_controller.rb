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
			redirect_to @game, flash: {notice: "Successful"}
		else
			flash[:error] = "Error. Try again"
			render 'new'
		end
	end

	def change
		@player = Player.find(params[:id])
		@amount = params[:thing].to_i
		@game = Game.find(@player.game_id)
		if params["+"]
			@player.update_column(:money, @player.money + @amount)
		elsif params["-"]
			if @player.money - @amount < 0
				flash[:alert] = "Insufficient funds"
			else
				@player.update_column(:money, @player.money - @amount)
			end
		elsif params["→"]
			if @player.money - @amount < 0
				flash[:alert] = "Insufficient funds"
			else
				@player.update_column(:money, @player.money - @amount)
				@game.update_column(:transfer, @game.transfer + @amount)
			end
		elsif params["←"]
			@player.update_column(:money, @player.money + @game.transfer)
			@game.update_column(:transfer, 0)
		end
     	redirect_to :back
	end

	def edit
		@game = Game.find(params[:game_id])
		@player = @game.players.find(params[:id])
	end

	def update
		@game = Game.find(params[:game_id])
		@player = @game.players.find(params[:id])
		if @player.update_attributes(player_params)
			redirect_to @game
		else
        	flash[:alert] = "Error. Refresh and try again."
			render 'edit'
		end
	end

	private

	def player_params
		params.require(:player).permit(:name, :color, :token)
	end
end
