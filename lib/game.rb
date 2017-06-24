require_relative 'word_maker'
require_relative 'dash'

class Game

  attr_reader :word
  attr_accessor :apples, :dashes

  def initialize(word)
    @apples = 10
    @word = word
    @dashes = make_dashes
  end

  def make_dashes
    dashes = []
    word.each_char { |char| dashes.push(Dash.new(char)) }
    dashes
  end

  def guess(letter)
    self.apples -= 1 if ! word.include?(letter)
  end

end
