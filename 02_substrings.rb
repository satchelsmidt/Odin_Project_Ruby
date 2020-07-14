#Goal: create function that takes in a string and an array of substrings, and returns an array of substrings in the input substring that were found in the input string, along with their counts 

def substrings(str, substrings)

    # create obj to store substrings and counts
    sub_object = {}

    #split input string into arr and make letters all downcase
    split_str = str.downcase.split("")

    #loop through input string
    split_str.each_with_index do |char, index|
        #build a new substr starting at each char
        substr = ""
    
        #slice arr into smaller
        slice_str = split_str.slice(index..-1)

        #loop through chars again, building substr as we go
        slice_str.each do |char|
            substr+=char

            #check arr first (check all agains lowercase)
            if(substrings.include?(substr))
                #if key already exists in obj, increment
                if(sub_object.key?(substr))
                    #if exists, increment
                    sub_object[substr] += 1
                else
                    #otherwise, set to 1
                    sub_object[substr] = 1
                end
            end
        end
    end
    return sub_object
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! Hows' it going?", dictionary)