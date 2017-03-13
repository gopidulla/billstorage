class Bill < ApplicationRecord
  belongs_to :user
  validates :section, :dvno, :typebill, :compactor, :rack, :shelf,  :presence => true
end
