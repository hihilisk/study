require 'json'

def reading_file
  @array_dictionary = IO.read('dictionary.txt').split
end

def creating_hash
  letter_range = :а..:я
  @array_latter = {}
  letter_range.each { |i| @array_latter.merge!({ i => [] }) }
end

def create_dictionary_to_hash
  @array_latter.each do |key, value|
    @array_dictionary.each do |element|
      if element.slice(0) == key.to_s
        @array_latter[key] = value.push(element)
      end
    end
  end

  File.write('hash_dictionary.json', @array_latter.to_json)
end

def opening_hash_dictionary_file
  @array_latter = JSON.parse( IO.read('hash_dictionary.json'))
end

def spellchecking(string)
  temp_string = string.gsub(/[^\p{L}\s\d]/, '').downcase.split
  result_string = []

  temp_string.each do |word|
    first_symbol = word.slice(0)

    @array_latter[first_symbol].each do |value|
      if word == value
        result_string.push(word)
      end
    end
  end

  if temp_string - result_string == 0
    'no errors in word`s`'
  else
    "in word '#{(temp_string - result_string).join('; ')}' there are mistakes, or these word`s no in the dictionary"
  end
end
