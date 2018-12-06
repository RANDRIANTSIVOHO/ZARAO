class UserjobsController < ApplicationController
  
    def new
        if !signed_in
    	    @user = Userjob.new
            @categories = Category.all
        else
            flash[:error] = "vous etes deja connecte"
            redirect_to root_path
        end
    end

    def create
        unless user = Userjob.find_by(email: params[:userjob][:email]) || user = Userservice.find_by(email: params[:userjob][:email]) || user = Admin.find_by(email: params[:userjob][:email])
        	user = Userjob.new(param)
            user.category = Category.find_by(title: params[:user][:category])
        	if user.valid?
        		user.save
                UserMailer.confirm(user).deliver_now
        		flash[:notice] = 'votre compte a ete cree avec succes, veuillez confirmer votre compte'
        		redirect_to root_path
        	else
        		flash[:error] = "donne invalide, veuillez reessayer"
        		redirect_to new_userjob_path
        	end
        else
            flash[:error] = "email deja utilisee"
            redirect_to new_userjob_path
        end
    end

    def update
    	user = current_user
        user.category = Category.find_by(title: params[:user][:category])
    	if user.update(param)
    		user.save
    		flash[:notice] = "mise a jours reuissie"
    		render show
    	else
    		flash[:error] = "donne invalid, veuillez reessayer"
    		redirect_to  edit_userjob_path(current_user.id)
    	end
    end

    def show
    	if signed_in
    		@user = current_user
    	end
    end

    def edit
    	if signed_in
            @categories = Category.all
    		@user = current_user
    	end
    end

    def destroy
        if params[:id] == current_user.id || uroot
        	Userjob.destroy(params[:id])
        	flash[:notice] = "votre compte a ete effacee avec succes"
        	redirect_to root_path
        else
            flash[:error] = "vous n'avez pas le droit de faire ce changement"
            redirect_to root_path
        end
    end

    def confirm
        if user = Userjob.find(params[:id])
            if user.confirmation_token == params[:token]
                flash[:notice] = "confirmation reussie, on vous remercie!!!"
                user.confirmation_token = nil
                user.confirmed = true
                user.save
                log_in user
                redirect_to root_path
            else
                flash[:error] = "token invalid"
                redirect_to root_path
            end
        else
            flash[:error] = "Compte introuvable"
            redirect_to root_path
        end
    end

    private

    def param
    	return params.require(:userjob).permit(:firstname, :lastname, :email, :password, :password_confirmation, :telephone, :description, :price)
    end

end
