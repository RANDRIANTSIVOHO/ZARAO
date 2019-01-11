class HomeController < ApplicationController
  
  	def index
  		@offer = Offer.new
		@offers = Offer.all
  	end

end
