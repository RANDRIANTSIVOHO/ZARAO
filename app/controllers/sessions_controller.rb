class SessionsController < ApplicationController
  
    def new

    end

    def create
    	if user = Userjob.find_by(email: params[:sessions][:email]) || user = Userservice.find_by(email: params[:sessions][:email]) || user = Admin.find_by(email: params[:sessions][:email])
    		if user.authenticate(params[:sessions][:password])
    			log_in user
    			flash[:notice] = "vous etes maintenant connectee"
    			redirect_to root_path
    		else
    			flash[:error] = "combinaison invalide"
    			redirect_to new_session_path
    		end
    	else
    		flash[:error] = "combinaison invalide"
    		redirect_to new_session_path
    	end
    end

    def destroy
    	log_out
    	flash[:notice] = "vous etes maintenant deconnectee"
    	redirect_to root_path
    end

end
