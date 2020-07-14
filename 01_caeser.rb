#Caeser/Shift Cypher is a simple encryption technique. Basically, each letter in the text is replaced by a letter x positions down the alphabet. 

#Goal: implement a Caeser cipher that takes a string, and a shift factor, and outputs the modified string

#Pseudocode:
#We want to loop through the characters in our input string, and for each character, add the char that is n steps down the alphabet from our current to a new string. Output the new string.

def caeser_cipher(str, n)
    #initialize our new str
    encrypted = ""

    #create arr of all lowercase letters
    lowercase = ("a".."z").to_a

    #create arr of all uppercase letters
    uppercase = ("A".."Z").to_a

    #set max num
    max = lowercase.length

    #loop through our input string
    str.each_char do |char|
        #for each char, check if upper or lower, turn into number, add appropriate steps to number, convert back to char using appropriate arr

        #if value is a valid alphabetic char
        if lowercase.include?(char) || uppercase.include?(char)

            #turn into number
            charNum = lowercase.find_index(char.downcase)

            if char == char.upcase
                #if value is uppercase, convert using that arr

                #if current + num < max length of arr, set new char
                if charNum + n <= max
                    newChar = uppercase[charNum+n]
                    #otherwise, calculate remainder and choose from beg of arr
                else
                    remainder = (charNum + n) - max
                    newChar = uppercase[remainder]                    
                end
            else
                #if value is lowercase, convert using that arr

                #if current + num < max length of arr, set new char
                if charNum + n <= max
                    newChar = lowercase[charNum+n]
                    #otherwise, calculate remainder and choose from beg of arr
                else
                    remainder = (charNum + n) - max
                    newChar = lowercase[remainder]                    
                end

            end
            #add new char to output str
            encrypted+=newChar
        else
            #otherwise, add existing char to output str
            encrypted += char 
        end
    end

    #return our new str
    return encrypted
end

caeser_cipher("What a string!", 5)