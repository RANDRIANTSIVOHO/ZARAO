class SessionsController < ApplicationController

    def new
        if signed_in
            flash[:error] = "Vous êtes déjà connecté"
            redirect_to root_path
        end
    end

    def create
    	if user = Userjob.find_by(email: params[:sessions][:email]) || user = Userservice.find_by(email: params[:sessions][:email]) || user = Admin.find_by(email: params[:sessions][:email])
    		if user.authenticate(params[:sessions][:password])
    			log_in user
    			flash[:notice] = "Vous êtes maintenant connecté"
                unless uroot
                    redirect_to root_path
                else
                    redirect_to userjobs_path
                end
    		else
    			flash[:error] = "Combinaison invalide"
    			redirect_to login_path
    		end
    	else
    		flash[:error] = "Combinaison invalide"
    		redirect_to login_path
    	end
    end

    def destroy
    	log_out
    	flash[:notice] = "Vous êtes maintenant déconnecté"
    	redirect_to root_path
    end

end
