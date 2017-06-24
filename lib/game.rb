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
    if ! secret_word.include?(letter)
      self.apples -= 1
    else
      reveal_letters(letter)
    end
  end

  def reveal_letters(letter)
    dashes.each do |dash|
      dash.reveal_letter if dash.letter == letter
    end
  end

end
