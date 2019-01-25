class UserjobsController < ApplicationController
    
    before_action :confirmed_count, only: [:index, :update, :show, :edit, :destroy]

    def index
        @user = Userjob.all
        @user1 = Userservice.all
        @offre = Offer.all
        @interested = Interested.all
    end

    def list
        i = 0
        @users = []
        if params[:title]
            Userjob.all.each do |u|
                if u.firstname.downcase.match(params[:title].downcase) || u.lastname.downcase.match(params[:title].downcase)
                  @users[i] = u
                  i += 1
                end
            end
        else
            @users = Userjob.all
        end
    end

    def new
        if !signed_in
    	    @user = Userjob.new
            @categories = Category.all
        else
            flash[:error] = "Vous êtes déja connecté" 
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
        		flash[:notice] = 'Votre compte a été créé avec succès, veuillez confirmer votre compte'
        		redirect_to root_path
        	else
        		flash[:error] = "Donnée invalide, veuillez réessayer"
        		redirect_to new_userjob_path
        	end
        else
            flash[:error] = "Email déja utilisé"
            redirect_to new_userjob_path
        end
    end

    def update
    	user = current_user
        user.category = Category.find_by(title: params[:user][:category])
    	if user.update(param)
    		user.save
    		flash[:notice] = "Mise à jour réussie"
    		redirect_to userjob_path(current_user.id)
    	else
    		flash[:error] = "Donnée invalide, veuillez réessayer"
    		redirect_to  edit_userjob_path(current_user.id)
    	end
    end

    def show
    	if signed_in
    		@user = Userjob.find(params[:id])
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
        	flash[:notice] = "Ce compte a été effacé avec succès"
            unless uroot
                redirect_to root_path
            else
                redirect_to userjobs_path
            end
        else
            flash[:error] = "Vous n'avez pas le droit de faire ce changement"
            redirect_to root_path
        end
    end

    def confirm
        if user = Userjob.find(params[:id])
            if user.confirmation_token == params[:token]
                flash[:notice] = "Confirmation réussie, on vous remercie!!!"
                user.confirmation_token = nil
                user.confirmed = true
                user.save
                log_in user
                redirect_to root_path
            else
                flash[:error] = "Token invalid"
                redirect_to root_path
            end
        else
            flash[:error] = "Compte introuvable"
            redirect_to root_path
        end
    end

    private

    def param
    	return params.require(:userjob).permit(:firstname, :lastname, :email, :password, :password_confirmation, :telephone, :description, :price, :avatar)
    end
end
