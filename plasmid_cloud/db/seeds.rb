# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

Keyword.delete_all
Plasmid.delete_all

freq_array = []

data = CSV.read("/Users/kireem/Documents/Projects/Cloud/code/plasmid_id_keywords.txt", { :col_sep => "\t" })
data.each do |array|
    if data.index(array) != 0
        if array[2] != nil
            keywords = CSV.parse(array[2])
            Plasmid.create(name: array[1], ID: array[0].to_i, keywords: keywords[0])
            keywords[0].each do |keyword|
                if keyword != nil
                    counted = false
                    freq_array.each do |hash|
                        if keyword.downcase.strip == hash["word"].downcase
                            hash["plasmids"][array[1]] = array[0].to_i
                            counted = true
                        end
                    end
                    
                    if counted == false
                        new_plasmids = Hash.new
                        new_plasmids[array[1]] = array[0].to_i
                        new_keyword = Hash.new
                        new_keyword["word"] = keyword
                        new_keyword["plasmids"] = new_plasmids
                        freq_array << new_keyword
                    end
                    
                    counted = false
                end
            end
        end
    end
end


freq_array.each do |hash|
    Keyword.create(word: hash["word"], plasmids: hash["plasmids"], frequency: hash["plasmids"].length)
end