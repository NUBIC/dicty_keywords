# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

Keyword.delete_all

freq_array = []
strain_array = []

data = CSV.read("/Users/kireem/Documents/Projects/Cloud/code/strain_char.txt", { :col_sep => "\t" })
data.each do |array|
    if data.index(array) != 0
        counted = false
        freq_array.each do |hash|
            if array[2].strip.downcase == hash["word"].downcase
                hash["strains"][array[1]] = array[0].to_i
                counted = true
            end
        end
        
        if counted == false
            new_strains = Hash.new
            new_strains[array[1]] = array[0].to_i
            new_keyword = Hash.new
            new_keyword["word"] = array[2]
            new_keyword["strains"] = new_strains
            freq_array << new_keyword
        end
        
        added = true
        strain_array.each do |hash|
            if array[1] == hash["name"]
                hash["keywords"] << array[2]
                added = false
            end
        end
        
        if added == true
            keywords = [array[2]]
            new_strain = Hash.new
            new_strain["name"] = array[1]
            new_strain["ID"] = array[0]
            new_strain["keywords"] = keywords
            strain_array << new_strain
        end
    
        counted = false
    end
end

freq_array.each do |hash|
    Keyword.create(word: hash["word"], strains: hash["strains"], frequency: hash["strains"].length)
end

strain_array.each do |hash|
    Strain.create(name: hash["name"], ID: hash["ID"], keywords: hash["keywords"])
end