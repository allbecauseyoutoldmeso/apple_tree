require_relative 'word_maker'

class Game

  attr_reader :word
  attr_accessor :apples, :dashes

  def initialize(word)
    @apples = 10
    @word = word
    @dashes = '-' * word.length
  end

end
