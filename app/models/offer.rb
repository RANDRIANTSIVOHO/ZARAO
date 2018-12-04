class Offer < ApplicationRecord
	
	belongs_to :userservice
	has_many :interesteds
	has_many :userjobs, through: :interesteds
	
end
