require 'json'

class Dictionary
  attr_reader :hash_dictionary

  def initialize
    @array_words = IO.read('./dictionary.txt').split
  end

  def creating_hash_dictionary
    @hash_dictionary = {}
    (:а..:я).each { |i| @hash_dictionary.merge!({ i => [] }) }

    @hash_dictionary.each do |key, array|
      @array_words.each do |word|
        if word.slice(0).to_sym.equal? key
          @hash_dictionary[key] = array.push(word)
        end
      end
    end
  end

  def saving_hash_dictionary
    File.write('./hash_dictionary.json', @hash_dictionary.to_json)
  end

  def loading_hash_dictionary
    @hash_dictionary = JSON.parse( IO.read('./hash_dictionary.json'))
  end
end
