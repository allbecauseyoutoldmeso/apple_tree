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

  describe('')

  describe('#word') do
    it 'returns the secret word' do
      expect(game.word).to eq 'teacup'
    end
  end

  describe('#guess') do
    it 'removes an apple if the guess is incorrect' do
      game.guess('i')
      expect(game.apples).to eq 9
    end
  end

end
