class HomeController < ApplicationController
	def delete
		begin
			@thing = Game.find(params[:id])
		rescue
			@thing = Player.find(params[:id])
		end
		@thing.destroy
		redirect_to root_path
	end
end
