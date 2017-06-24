require_relative 'word_maker'

class Game

  attr_reader :word
  attr_accessor :apples

  def initialize(word_length)
    @apples = 10
    @word = WordMaker.new.get_word(word_length)
  end

end
