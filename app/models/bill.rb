class Bill < ApplicationRecord
  belongs_to :user
  
  
  has_many :dvs, dependent: :destroy, inverse_of: :bill

  accepts_nested_attributes_for :dvs, allow_destroy: true,
                              reject_if: ->(attrs) { attrs['dvno'].blank? }



  validates :section, :month, :typebill, :compactor, :rock, :shelf,  :presence => true


  validates_numericality_of :dvno, :only_integer => true, :allow_nil => true, 
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 9999,
    :message => "can only be whole number between 1 and 9999."
  

   def self.search(search)
		if search
			where(["dvno LIKE ?", "%#{search}%"])
      
		else
			all
		end
	end

end
