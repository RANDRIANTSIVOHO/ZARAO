class UserservicesController < ApplicationController
  
    def new
      if !signed_in
        @user = Userservice.new
      else
        flash[:error] = "vous etes deja connecte"
        redirect_to root_path
      end
    end

    def create
      user = Userservice.new(param)
      if user.valid?
        user.save
        UserMailer.confirm(user, false).deliver_now
        flash[:notice] = 'votre compte a ete cree avec succes, veuillez confirmer votre compte'
        redirect_to root_path
      else
        flash[:error] = "donne invalide, veuillez reessayer"
        redirect_to new_userservice_path
      end 
    end

    def update
      user = current_user
      if user.update(param)
        user.save
        flash[:notice] = "mise a jours reuissie"
        render show
      else
        flash[:error] = "donne invalid, veuillez reessayer"
        redirect_to  edit_userservice_path(current_user.id)
      end
    end

    def show
      if signed_in
        @user = current_user
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
        flash[:notice] = "votre compte a ete effacee avec succes"
        redirect_to root_path
      else
        flash[:error] = "vous n'avez pas le droit de faire ce changement"
        redirect_to root_path
      end
    end

    def confirm
      if user = Userservice.find(params[:id])
          if user.confirmation_token == params[:token]
            flash[:notice] = "confirmation reussie, on vous remercie!!!"
            user.confirmation_token = nil
            user.confirmed = true
            user
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
      return params.require(:userservice).permit(:firstname, :lastname, :email, :password, :password_confirmation, :telephone)
    end


end
