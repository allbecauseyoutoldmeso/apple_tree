require_relative 'word_maker'
require_relative 'word_keeper'
require_relative 'dash'

class Game

  attr_reader :word_keeper, :word_maker, :incorrect_guesses
  attr_accessor :apples

  def initialize(word_maker = WordMaker.new(6))
    @apples = 10
    @word_maker = word_maker
    @word_keeper = WordKeeper.new(word_maker.word)
    @incorrect_guesses = []
  end

  def revealed_word
    word_keeper.revealed_word.join
  end

  def guess(letter)
    letter = letter.downcase
    if word_keeper.secret_word_includes?(letter)
      word_keeper.reveal_letters(letter)
    else
      self.apples -= 1
      incorrect_guesses.push(letter)
    end
  end

  def final_message
    word_keeper.guessed_word? ? 'you won!' : "you lose. the word was #{word_maker.word}."
  end

  def game_over?
    word_keeper.guessed_word? || apples == 0
  end

  def word_definition
    "#{word_maker.word}: #{word_maker.definition}"
  end

end
