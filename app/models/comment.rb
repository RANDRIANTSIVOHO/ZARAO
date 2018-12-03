class Comment < ApplicationRecord
	has_many :userjobs
	has_many :userservices
end
