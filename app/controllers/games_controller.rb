class GamesController < ApplicationController
	def new
		@game = Game.new
	end

	def create
		@game = Game.create game_params
		if @game.save
			@game.update_column(:user_id, current_user)
			@game.update_column(:transfer, 0)
			redirect_to "http://gamemoneytracker.herokuapp.com/"
		else
			render 'new'
		end
	end

	def show
		@game = Game.find(params[:id])
	end

	def edit
		@game = Game.find(params[:id])
	end

	def update
		@game = Game.find(params[:id])
		if @game.update_attributes(game_params)
			redirect_to @game
		else
        	flash[:error] = "Error. Refresh and try again."
			render 'edit'
		end
	end

	private

	def game_params
		params.require(:game).permit(:name)
	end
end
