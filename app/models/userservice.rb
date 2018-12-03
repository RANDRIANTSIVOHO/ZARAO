class Userservice < ApplicationRecord
	belongs_to :comment
	has_many :offers
end
