require 'pry-byebug'

def caesar_cipher(string, factor)
    # Create the variable outside the loop so we can return it
    back_to_letters = ""

    #Turn the string into a array of letters, then mapped to their ordinals
    ordinals_array = string.split("").map {|letter| letter.ord}

    # for each letter apply the shift, if the ordinal is between 65 and 90 or 97 and 122,
    # if not, it is a space or punctuation and should be left alone
    ordinals_array.each do |ord|
        # if letter < 91, then the case is 65, other wise it is 97
        shift_case = ord < 91 ? 65 : 97
        if ord.between?(65,90) || ord.between?(97,122)
            # formula for ciphertext
             cipher = (((ord - shift_case) +  factor) % 26)+ shift_case
             back_to_letters += cipher.chr
        else
            # if it is not a letter, leave it unshifted and just turn it back into a char
            back_to_letters += ord.chr
        end
    end
    p back_to_letters
end

caesar_cipher("What a string!", 5)