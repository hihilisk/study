class Spellchecking
  def initialize(string)
    @temp_string = string.gsub(/[^\p{L}\s\d]/, '').downcase.split
    @result_string = []
  end

  def check_spelling(hash_dictionary)
    @temp_string.each do |word|
      first_symbol = word.slice(0)

      hash_dictionary[first_symbol].each do |true_word|
        @result_string.push(word) if true_word == word
      end
    end
  end

  def return_result
    if (@temp_string - @result_string).size.zero?
      'no errors in word`s`'
    else
      "in word '#{(@temp_string - @result_string).join('; ')}' there are mistakes, or these word`s no in the dictionary"
    end
  end
end
