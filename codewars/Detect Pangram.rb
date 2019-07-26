def panagram?(string)
  temp_array = ('a'..'z').to_a
  array_string = string.downcase.gsub(/[^0-9A-Za-z]/, '').chars.uniq

  if temp_array - array_string == 0
    true
  end

  false

  # (('a'..'z').to_a - string.downcase.gsub(/[^0-9A-Za-z]/, '').chars.uniq).size == 0 ? true : false альтернатива
end

# A pangram is a sentence that contains every single letter of the alphabet at least once.
# For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram,
# because it uses the letters A-Z at least once (case is irrelevant).
#
#     Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.
