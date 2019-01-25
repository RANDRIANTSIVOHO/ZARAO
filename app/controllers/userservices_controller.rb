class UserservicesController < ApplicationController
    
    before_action :confirmed_count, only: [:update, :show, :edit, :destroy]
  
    def new
      if !signed_in
        @user = Userservice.new
      else
        flash[:error] = "Vous êtes déjà connecté"
        redirect_to root_path
      end
    end

    def create
      unless user = Userjob.find_by(email: params[:userservice][:email]) || user = Userservice.find_by(email: params[:userservice][:email]) || user = Admin.find_by(email: params[:userservice][:email])
        user = Userservice.new(param)
        if user.valid?
          user.save
          UserMailer.confirm(user, false).deliver_now
          flash[:notice] = 'Votre compte a été créé avec succès, veuillez confirmer votre compte'
          redirect_to root_path
        else
          flash[:error] = "Donnée invalide, veuillez réessayer"
          redirect_to new_userservice_path
        end
      else
        flash[:error] = "Email déjà utilisé"
        redirect_to new_userservice_path
      end
    end

    def update
      user = current_user
      if user.update(param)
        user.save
        flash[:notice] = "Mise à jour réussie"
        redirect_to userservice_path(current_user.id)
      else
        flash[:error] = "Donnée invalide, veuillez réessayer"
        redirect_to  edit_userservice_path(current_user.id)
      end
    end

    def show
      if signed_in
        @user = Userservice.find(params[:id])
      end
    end

    def edit
      if signed_in
        @user = current_user
      end
    end

    def destroy
      if params[:id] == current_user.id || uroot
        Userservice.destroy(params[:id])
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
      if user = Userservice.find(params[:id])
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
      return params.require(:userservice).permit(:firstname, :lastname, :email, :password, :password_confirmation, :telephone, :pdp1)
    end


end
