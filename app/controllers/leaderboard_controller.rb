class LeaderboardController < ApplicationController
  def index
  	@genres = Genre.all
  	@subgenres = Subgenre.all
  	# @list ||= []
  	# @scores = []
  	@leaderboards = []
  	@leaderboards_names = []

  	@subgenres.each do |subgenre|
  		# @temp = subgenre
  		@top_scorers = Score.order(points: :desc).where(subgenre_id: subgenre.id).take(10)
  		@leaderboards.push(@top_scorers);
  		@leaderboards_names.push(@top_scorers.map { |scorer| User.find(scorer.user_id).first_name});
  		# if @score
  			# @scores.push(@score.points)
  		# else
  			# @scores.push("Not attempted")
  		# end
  	end
  end
end
