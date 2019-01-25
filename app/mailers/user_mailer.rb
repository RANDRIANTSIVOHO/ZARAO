class UserMailer < ApplicationMailer

	def confirm(user, type = true)
		@user = user
		@type = type
		mail(to: user.email, subject: "inscription sur le site ZARAO")
	end

end
