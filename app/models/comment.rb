class Comment < ApplicationRecord
	
	belongs_to :userjobs, optional: true
	belongs_to :userservices, optional: true

	validates :description,
				presence: true,
				length: {minimum: 5, maximum: 255}
end
