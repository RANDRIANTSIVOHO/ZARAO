class Offer < ApplicationRecord
	
	belongs_to :userservice
	has_many :interesteds
	has_many :userjobs, through: :interesteds

	validates :title,
				presence: true,
				length: {minimum: 3, maximum: 55}

	validates :description,
				presence: true,
				length: {minimum: 5, maximum: 255}
	
end
