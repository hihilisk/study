require './class/class_Spellchecking'
require './class/class_Dictionary'

dictionary = Dictionary.new

dictionary.loading_hash_dictionary

string = Spellchecking.new('аптека улица удав нИт такова слофа')

string.check_spelling(dictionary.hash_dictionary)

p string.return_result
