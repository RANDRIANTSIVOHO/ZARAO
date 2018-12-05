class InterestedsController < ApplicationController

	before_action :signed_in 

	def create
		i = Interested.new
		i.userjob = current_user
		i.offer = Offer.find(params[:id])
		i.save
		flash[:notice] = "vous etes interesee par ce projet"
		redirect_to root_path
	end

	def destroy
		if i = Interested.find_by(userjob_id: current_user, offer_id: params[:id])
			i.destroy
			flash[:notice] = "vous n etes plus interesse"
			redirect_to root_path
		else
			flash[:error] = "vous n etes pas interesse"
			redirect_to root_path
		end
	end

end
