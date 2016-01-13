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
		# @player = Player.find(params[:id])
		# @amount = params[:amount].to_i
		# @text = @player.amount
		# if params[:commit] == "+"
		# 	@text = 'attempted add'
		# 	@player.update_column(:money, @player.money + @amount)
		# end
		# if params[:commit] == "-"
		# 	@player.update_column(:money, @player.money - @amount)
		# 	@text = 'attempted subract'
		# end
	end

	private

	def game_params
		params.require(:game).permit(:name)
	end
end
