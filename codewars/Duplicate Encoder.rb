def duplicate_encode(word)
  word_temp = word.downcase.chars
  (word_temp.collect { |char| (word_temp.grep(char)).size >= 2 ? ')' : '(' }).join
end

# The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.
#
#     Examples
# "din"      =>  "((("
# "recede"   =>  "()()()"
