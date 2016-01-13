class GamesController < ApplicationController
	def new
		@game = Game.new
	end

	def create
		@game = Game.create game_params
		if @game.save
			@game.update_column(:user_id, current_user)
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@game = Game.find(params[:id])
	end

	private

	def game_params
		params.require(:game).permit(:name)
	end
end
