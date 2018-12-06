class Userservice < ApplicationRecord

	has_many :comment
	has_many :offers	

	validates :firstname,
				presence: true,
				length: {minimum: 3, maximum: 55}


	validates :lastname,
				presence: true,
				length: {minimum: 3, maximum: 55}

	validates :email,
				presence: true,
				length: {maximum: 255},
				format: {with: /\A([\w\-\.]+@[A-Za-z0-9]+\.[A-Za-z]{3,8})\z/},
				uniqueness: {case_sensitive: false}

	validates :telephone,
				presence: true
				

	has_secure_password

	has_secure_token :confirmation_token

end
