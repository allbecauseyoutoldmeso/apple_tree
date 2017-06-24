require 'game'

describe Game do

  subject(:game) { described_class.new('teacup') }

  describe('#apples') do
    it 'initially returns 10' do
      expect(game.apples).to eq 10
    end
  end

  describe('#dashes') do
    it 'returns an array of dashes' do
      expect(game.dashes.all? { |element| element.is_a?(Dash) }).to eq true
    end
  end

  describe('#revealed_word') do
    it 'initially returns the correct number of dashes' do
      expect(game.revealed_word).to eq ['-', '-', '-', '-', '-', '-']
    end
  end

  describe('#secret_word') do
    it 'returns the letters of the secret word' do
      expect(game.secret_word).to eq ['t', 'e', 'a', 'c', 'u', 'p']
    end
  end

  describe('#guess') do
    it 'removes an apple if the guess is incorrect' do
      game.guess('i')
      expect(game.apples).to eq 9
    end
    it 'reveals a letter if the guess is correct' do
      game.guess('c')
      expect(game.revealed_word).to eq ['-', '-', '-', 'c', '-', '-'] 
    end
  end

end
