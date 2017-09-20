class LeaderboardController < ApplicationController
  def index
  	@genres = Genre.all
  	@subgenres = Subgenre.all
  	@leaderboards = []
  	@leaderboards_names = []

  	@subgenres.each do |subgenre|
  		@top_scorers = Score.order(points: :desc).where(subgenre_id: subgenre.id).take(10)
  		@leaderboards.push(@top_scorers);
  		@leaderboards_names.push(@top_scorers.map { |scorer| User.find(scorer.user_id).first_name});
  	end
  end
end
