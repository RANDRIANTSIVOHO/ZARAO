module SessionsHelper

	def log_in(user)
		session[:email] = user.email
	end

	def current_user
		if a = Userjob.find_by(email: session[:email])
			return a
		elsif b = Userservice.find_by(email: session[:email])
			return b
		elsif c = Admin.find_by(email: session[:email])
			return c
		else
			return current_user = nil
		end				
	end

	def signed_in
		return !current_user.nil?
	end

	def log_out
		current_user = nil
		session.delete(:email)
	end

	def root
		unless signed_in && current_user.admin == true
			flash[:error] = "vous n'etes pas autorisee a faire ce changement"
			redirect_to root_path
		end
	end

end
