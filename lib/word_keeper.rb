class WordKeeper

  attr_reader :dashes

  def initialize(word)
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

  def secret_word_includes?(letter)
    dashes.map { |dash| dash.letter }.include?(letter)
  end

  def reveal_letters(letter)
    dashes.each { |dash| dash.reveal_letter if dash.letter == letter }
  end

  def guessed_word?
    dashes.all? { |dash| dash.revealed_symbol != '-' }
  end

end
