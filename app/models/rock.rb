class Rock < ApplicationRecord
	has_many :shelves
    has_many :bills
end
