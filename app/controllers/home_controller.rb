class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@genres = Genre.all
  	@subgenres = Subgenre.all
  end
end
