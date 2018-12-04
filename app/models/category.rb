class Category < ApplicationRecord
	
	validates :title,
				presence: true,
				length: {minimum: 3, maximum: 55}

	has_many :userjobs
	
end
