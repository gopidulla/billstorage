# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts "Importing sections..."
CSV.foreach(Rails.root.join("sections.csv"), headers: true) do |row|
  Section.create! do |section|
    section.id = row[0]
    section.name = row[1]
  end
end

puts "Importing typebills..."
CSV.foreach(Rails.root.join("typebills.csv"), headers: true) do |row|
  Typebill.create! do |typebill|
    typebill.name = row[0]
    typebill.section_id = row[2]
  end
end