class Comment < ApplicationRecord
	
	has_many :userjobs
	has_many :userservices

	validates :description,
				presence: true,
				length: {minimum: 5, maximum: 255}
end
