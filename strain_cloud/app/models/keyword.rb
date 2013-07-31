class Keyword < ActiveRecord::Base
    serialize :strains

    def recursive
        freq_array = []
        self.strains.keys.each do |key|
            temp_strain = Strain.find_by_name(key)
            temp_strain.keywords.each do |keyword|
                counted = false
                freq_array.each do |hash|
                    if keyword.downcase.strip == hash["word"].downcase
                        hash["strains"][key] = temp_strain.ID
                        counted = true
                    end
                end
                
                if counted == false
                    new_strains = Hash.new
                    new_strains[key] = temp_strain.ID
                    new_keyword = Hash.new
                    new_keyword["word"] = keyword
                    new_keyword["strains"] = new_strains
                    freq_array << new_keyword
                end
                
                counted = false
            end
        end
        freq_array.each do |hash|
            hash["frequency"] = hash["strains"].length
            if hash["word"] == self.word
                freq_array.delete(hash)
            end
        end
        
    end
end