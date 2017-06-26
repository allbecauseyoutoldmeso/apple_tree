require_relative 'word_maker'
require_relative 'word_keeper'
require_relative 'dash'

class Game

  attr_reader :word_keeper, :word
  attr_accessor :apples

  def initialize(word=WordMaker.new.get_word(6))
    @apples = 10
    @word = word
    @word_keeper = WordKeeper.new(word)
  end

  def revealed_word
    word_keeper.revealed_word.join
  end

  def guess(letter)
    word_keeper.secret_word_includes?(letter) ? word_keeper.reveal_letters(letter) : self.apples -= 1
  end

  def final_message
    word_keeper.guessed_word? ? 'you won!' : "you lose. the word was #{word}."
  end

  def game_over?
    word_keeper.guessed_word? || apples == 0
  end

  def word_definition
    "#{word}: #{WordMaker.new.get_definition(word)}"
  end

end
