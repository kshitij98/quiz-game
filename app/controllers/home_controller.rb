class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@genres = Genre.all
  	@subgenres = Subgenre.all
  	# @list ||= []
  	@scores = []
  	@subgenres.each do |subgenre|
  		# @temp = subgenre
  		@score = Score.order(points: :desc).where(user_id: current_user.id, subgenre_id: subgenre.id).take
  		if @score
  			@scores.push(@score.points)
  		else
  			@scores.push("Not attempted")
  		end
  	end
  end
end
