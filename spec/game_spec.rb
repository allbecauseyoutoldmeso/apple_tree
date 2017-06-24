require 'game'

describe Game do

  subject(:game) { described_class.new(6) }

  describe('#apples') do
    it 'initially returns 10' do
      expect(game.apples).to eq 10
    end
  end

  describe('#dashes') do
    it 'returns a string of dashes the same length as the word' do
      expect(game.dashes).to eq '------'
    end
  end

  describe('#word') do
    it 'returns a word' do
      expect(game.word).to be_a(String)
    end
    it 'returns a word of the specified length' do
      expect(game.word.length).to eq 6
    end
  end

  describe('#guess') do
  end

end
