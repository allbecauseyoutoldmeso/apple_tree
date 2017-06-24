class Dash

  attr_reader :letter
  attr_accessor :revealed_symbol

  def initialize(letter)
    @letter = letter
    @revealed_symbol = '-'
  end

  def reveal_letter
    self.revealed_symbol = letter
  end

end
