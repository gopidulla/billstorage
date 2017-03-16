class Shelf < ApplicationRecord
	belongs_to :rock
    has_many :bills
end
