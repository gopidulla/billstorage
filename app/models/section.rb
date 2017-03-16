class Section < ApplicationRecord
 has_many :typebills
 has_many :bills
end
