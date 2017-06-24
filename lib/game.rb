require_relative 'word_maker'
require_relative 'dash'

class Game

  attr_accessor :apples, :dashes

  def initialize(word)
    @apples = 10
    @dashes = make_dashes(word)
  end

  def make_dashes(word)
    dashes = []
    word.each_char { |char| dashes.push(Dash.new(char)) }
    dashes
  end

  def revealed_word
    dashes.map { |dash| dash.revealed_symbol }
  end

  def secret_word
    dashes.map { |dash| dash.letter }
  end

  def guess(letter)
    secret_word.include?(letter) ? reveal_letters(letter) : self.apples -= 1
  end

  def reveal_letters(letter)
    dashes.each { |dash| dash.reveal_letter if dash.letter == letter }
  end

end
