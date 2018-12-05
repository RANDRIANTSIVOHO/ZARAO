class Userjob < ApplicationRecord
 
	belongs_to :category
	has_many :comment
	has_many :interesteds
	has_many :offers, through: :interesteds

	validates :firstname,
				presence: true,
				length: {minimum: 3, maximum: 55}


	validates :lastname,
				presence: true,
				length: {maximum: 55}

	validates :email,
				presence: true,
				length: {maximum: 255},
				format: {with: /\A([\w\-\.]+@[A-Za-z0-9]+\.[A-Za-z]{3,8})\z/},
				uniqueness: {case_sensitive: false}

	validates :telephone,
				presence: true

	validates :description,
				presence: true,
				length: {maximum: 255}

	validates :price,
				presence: true

	has_secure_password

	has_secure_token :confirmation_token
										
end
