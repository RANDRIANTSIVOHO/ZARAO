class UserservicesController < ApplicationController
  
    def new
      @user = Userservice.new
    end

    def create
      user = Userservice.new(param)
      if user.valid?
        user.save
        flash[:notice] = 'votre compte a ete cree avec succes, veuillez confirmer votre compte'
        redirect_to root_path
      else
        flash[:error] = "donne invalide, veuillez reessayer"
        render 'new'
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
        render 'edit'
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
      Userservice.destroy(params[:id])
      flash[:notice] = "votre compte a ete effacee avec succes"
      redirect_to root_path
    end

    private

    def param
      return params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :telephone)
    end


end
