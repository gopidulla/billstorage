class Search < ApplicationRecord


validates_numericality_of :dvno, :only_integer => true, :allow_nil => true, 
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 9999,
    :message => "can only be whole number between 1 and 9999."

    
	def search_bills

		bills = Bill.all

		bills = bills.where(["section LIKE ?", "%#{keywords}%"]) if keywords.present?
		bills = bills.where(["year LIKE ?", year]) if year.present?
		bills = bills.where(["month LIKE ?", month]) if month.present?

		bills = bills.where(["dvno LIKE ?", dvno]) if dvno.present?

		return bills
		
	end

end
