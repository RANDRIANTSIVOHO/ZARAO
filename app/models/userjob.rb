class Userjob < ApplicationRecord
	belongs_to :category
	belongs_to :comment
	has_many :interesteds
	has_many :offers, through: :interesteds
end
