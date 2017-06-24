require 'game'

describe Game do

  subject(:game) { described_class.new('teacup') }

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
    it 'returns the secret word' do
      expect(game.word).to eq 'teacup'
    end
  end

  describe('#guess') do
  end

end
