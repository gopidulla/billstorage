require 'csv'


class Bill < ApplicationRecord
  belongs_to :user
  
  




validates_uniqueness_of :dvno, :scope => :month

  validates :section, :month, :typebill, :compactor, :rock, :shelf, :bundleno,  :presence => true

  validates_uniqueness_of :dvno, :scope => :month
  
  validates_numericality_of :dvno, :only_integer => true, :allow_nil => true, 
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 9999,
    :message => "can only be whole number between 1 and 9999."
  

validates_numericality_of :bundleno, :only_integer => true, :allow_nil => true, 
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 99,
    :message => "can only be whole number between 1 and 99."



   def self.search(search)
		if search
			where(["dvno LIKE ?", "%#{search}%"])
      
		else
			all
		end
	end

  def self.to_csv(options = {})
    desired_columns = ["id", "section", "year", "month", "dvno", "typebill", "compactor", "rock", "shelf", "bundleno"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |bill|
        csv << bill.attributes.values_at(*desired_columns)
      end
    end
  end
  
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      bill = find_by(id: row["id"]) || new
      bill.attributes = row.to_hash
      bill.save!
    end
  end  

end
