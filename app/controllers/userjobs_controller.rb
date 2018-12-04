class UserjobsController < ApplicationController
  
    def new
    	@user = Userjob.new
        @categories = Category.all
    end

    def create
    	user = Userjob.new(param)
        user.Category = Category.find_by(title: params[:user][:category])
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
    	Userjob.destroy(params[:id])
    	flash[:notice] = "votre compte a ete effacee avec succes"
    	redirect_to root_path
    end

    private

    def param
    	return params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :telephone, :description, :price)
    end

end
