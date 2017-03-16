class Typebill < ApplicationRecord
  belongs_to :section
  has_many :bills
end
