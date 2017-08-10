require "byebug"

class Game
  attr_accessor :player1, :player2, :fragment, :dictionary, :glossary
  def initialize(players)
    @player1 = player1
    @player2 = player2
    @fragment = ""
    @dictionary = File.readlines("./dictionary.txt").reduce({}) do |obj, word|
      obj[word[0...-1]] = true
      obj
    end
    hash = Hash.new { |h, k| h[k] = []}
    @glossary = File.readlines("./dictionary.txt").reduce(hash) do |obj, word|
      obj[word[0]] << word[0...-1]
      obj
    end
  end

  def current_player
    player2
  end

  def previous_player
    player1
  end

  def next_player!
    @player1, @player2 = @player2, @player1
  end

  def take_turn(player)
    puts "Enter a letter."
    letter = gets.chomp.downcase
    until valid_play?(letter)
      puts "Please enter a letter from a-z"
      puts "Make sure you can complete an English word"
      letter = gets.chomp.downcase
    end
    @fragment += letter
  end

  def valid_play?(string)
    alphabet = ("a".."z").to_a
    return alphabet.include?(string) if fragment.length == 0
    alphabet.include?(string) &&
    glossary[fragment[0]].any? do |word|
      word[0..fragment.length] == fragment + string
    end
  end

  def won?
    dictionary[fragment]
  end

  def play_round
    until won?
      next_player!
      take_turn(current_player)
      puts @fragment
    end
    puts "#{current_player.name} wins this round!"
    previous_player.add_letter
    @fragment = ""
    puts "#{player1.name}: #{player1.score}"
    puts "#{player2.name}: #{player2.score}"
  end

  def play_game
    until [player1.score, player2.score].include?("GHOST")
      play_round
    end
    puts "#{current_player.name} wins the game!"
  end

end

class Player
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = ""
  end

  def add_letter
    @score += "GHOST"[@score.length]
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "How many players are there?"
  num = gets.chomp.to_i
  arr = []
  (1..num).each do |n|
    puts "What is the name of player #{n}?"
    arr << Player.new(gets.chomp)
  end
  g = Game.new(arr)
  g.play_game
end
