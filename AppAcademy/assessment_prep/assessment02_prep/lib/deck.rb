require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    answer = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        answer << Card.new(suit, value)
      end
    end
    answer
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    if n > count
      raise "not enough cards"
    end
    taken = @cards[0...n]
    n.times { @cards.shift }
    taken
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    cards.each { |card| @cards.push(card) }
  end
end
