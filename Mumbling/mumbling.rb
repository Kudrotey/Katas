def mumble(letters)
    letters.downcase
    output = letters[0].upcase + '-'
    for letter_position in (1...letters.length)
        if letters[-1] == letters[letter_position]
            output += "#{letters[letter_position].upcase}#{letters[letter_position].downcase*letter_position}"
        else
            output += "#{letters[letter_position].upcase}#{letters[letter_position].downcase*letter_position}-"
        end
    end
    return output
end