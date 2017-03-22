class Dv < ApplicationRecord
  belongs_to :bill

  validates :dvno,  :presence => true
end
