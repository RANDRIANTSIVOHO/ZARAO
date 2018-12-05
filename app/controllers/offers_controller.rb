class OffersController < ApplicationController

	def new
		@offer = Offer.new
		@offers = Offer.all
	end

	def create
		o = Offer.new(param)
		!utype ? o.userservice = current_user : false
		if o.valid?
			o.save!	
			flash[:notice] = "publication reussie"
			redirect_to root_path
		else
			flash[:error] = "un des donnees est invalid, veuillez le refaire"
			redirect_to root_path
		end
	end

	def destroy
		if o = Offer.find(params[:id])
			if o.userservice_id == current_user.id || current_user.admin == true
				o.destroy
				flash[:notice] = "suppression avec succes"
				redirect_to root_path
			else
				flash[:error] = "vous n'avez pas le droit de faire ce changement"
				redirect_to root_path
			end
		else
			flash[:error] = "offre introuvable"
			redirect_to root_path
		end
	end

	private

	def param
		return params.require(:offer).permit(:title, :description, :price, :delais)
	end

end
