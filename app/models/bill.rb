class Bill < ApplicationRecord
  belongs_to :user
  validates :section, :month, :dvno, :typebill, :compactor, :rack, :shelf,  :presence => true
end
