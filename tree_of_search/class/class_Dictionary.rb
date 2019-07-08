require 'json'

class Dictionary
  def initialize
    take_word_array
  end

  def take_word_array
    IO.read('./dictionary.txt').split
  end

  def create_hash_dictionary
    hash_dictionary = {}
    (:а..:я).each { |i| hash_dictionary.store(i, []) }
    hash_dictionary
  end

  def fill_hash_dictionary
    create_hash_dictionary.each do |key, array|
      take_word_array.each do |word|
        if word.slice(0).to_sym.equal? key
          create_hash_dictionary[key] = array.push(word)
        end
      end
    end
  end

  def saving_hash_dictionary
    IO.write('./hash_dictionary.json', fill_hash_dictionary.to_json)
  end

  def loading_hash_dictionary
    JSON.parse( IO.read('./hash_dictionary.json'), symbolize_names: true )
  end
end
