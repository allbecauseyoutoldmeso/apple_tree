require_relative 'word_maker'
require_relative 'word_keeper'
require_relative 'dash'

class Game

  attr_reader :word_keeper
  attr_accessor :apples

  def initialize(word)
    @apples = 10
    @word_keeper = WordKeeper.new(word)
  end

  def revealed_word
    word_keeper.revealed_word
  end

  def guess(letter)
    word_keeper.secret_word_includes?(letter) ? word_keeper.reveal_letters(letter) : self.apples -= 1
    puts word_keeper.revealed_word
    puts 'you win!' if word_keeper.guessed_word?
    puts 'you lose' if apples == 0
  end

end
