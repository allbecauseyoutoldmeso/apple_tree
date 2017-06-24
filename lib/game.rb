require_relative 'word_maker'
require_relative 'word_keeper'
require_relative 'dash'

class Game

  attr_reader :word_keeper
  attr_accessor :apples

  def initialize(word=WordMaker.new.get_word(6))
    @apples = 10
    @word_keeper = WordKeeper.new(word)
  end

  def revealed_word
    word_keeper.revealed_word
  end

  def guess(letter)
    word_keeper.secret_word_includes?(letter) ? word_keeper.reveal_letters(letter) : self.apples -= 1
    console_feedback
  end

  def console_feedback
    puts revealed_word.join
    puts "#{apples} apples left."
    puts 'you lose!' if apples == 0
    puts 'you win!' if word_keeper.guessed_word?
  end

end
