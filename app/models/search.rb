class Search < ApplicationRecord
  
  def bill
  	  @bill ||= find_bills
  end


private 

def find_bills
	
	bills = bills.where(dvno: dvno) if dvno.present?
end
end
