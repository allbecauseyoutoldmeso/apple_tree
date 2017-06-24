require 'game'

describe Game do

  subject(:game) { described_class.new('teacup') }

  describe('#apples') do
    it 'initially returns 10' do
      expect(game.apples).to eq 10
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
