class Keyword < ActiveRecord::Base
    serialize :plasmids
    
    def recursive
        freq_array = []
        self.plasmids.keys.each do |key|
            temp_plasmid = Plasmid.find_by_name(key)
            temp_plasmid.keywords.each do |keyword|
                counted = false
                freq_array.each do |hash|
                    if keyword.downcase.strip == hash["word"].downcase
                        hash["plasmids"][key] = temp_plasmid.ID
                        counted = true
                    end
                end
                    
                if counted == false
                    new_plasmids = Hash.new
                    new_plasmids[key] = temp_plasmid.ID
                    new_keyword = Hash.new
                    new_keyword["word"] = keyword
                    new_keyword["plasmids"] = new_plasmids
                    freq_array << new_keyword
                end
                    
                counted = false
            end
        end
        freq_array.each do |hash|
            hash["frequency"] = hash["plasmids"].length
            if hash["word"] == self.word
                freq_array.delete(hash)
            end
        end
        
    end
end