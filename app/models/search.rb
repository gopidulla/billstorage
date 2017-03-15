class Search < ApplicationRecord

	def search_bills

		bills = Bill.all

		bills = bills.where(["section LIKE ?", "%#{keywords}%"]) if keywords.present?
		bills = bills.where(["year LIKE ?", year]) if year.present?
		bills = bills.where(["month LIKE ?", month]) if month.present?
		bills = bills.where(["dvno LIKE ?", dvno]) if dvno.present?

		return bills
		
	end

end
