class OffersController < ApplicationController

	before_action :confirmed_count

	def new
		@offer = Offer.new
		@offers = Offer.all
	end

	def create
		o = Offer.new(param)
		unless uroot
			o.userservice = !utype ? current_user : nil
			if o.valid?
				o.save!	
				flash[:notice] = "publication reussie"
				redirect_to root_path
			else
				flash[:error] = "un des donnees est invalid, veuillez le refaire"
				redirect_to root_path
			end
		else
			o.save(validate: false)
		end
		
	end

	def destroy
		if o = Offer.find(params[:id])
			if o.userservice_id == current_user.id || current_user.admin == true
				Interested.all.each do |x|
					if x.offer_id == o.id
						x.destroy
					end
				end
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