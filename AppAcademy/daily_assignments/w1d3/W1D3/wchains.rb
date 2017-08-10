require 'byebug'
require 'set'

class WordChainer
attr_reader :dictionary

def initialize(dictionary = File.readlines('dictionary.txt'))
  dict = dictionary.map { |el| el.chomp }
  @dictionary = dict.to_set
end

def adjacent_words(word)
  equal = dictionary.select {|el| el.length == word.length}
  (0...word.length).each do |idx|
    beginning = word[0...idx]
    ending = word[idx + 1..-1]
  end
end


end

w = WordChainer.new

w.adjacent_words("house")
