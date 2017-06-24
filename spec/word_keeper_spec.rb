require 'word_keeper'

describe WordKeeper do

  subject(:word_keeper) { described_class.new('teacup') }

  describe('#dashes') do
    it 'returns an array of dashes' do
      expect(word_keeper.dashes.all? { |element| element.is_a?(Dash) }).to eq true
    end
  end

  describe('#revealed_word') do
    it 'initially returns the correct number of dashes' do
      expect(word_keeper.revealed_word).to eq ['-', '-', '-', '-', '-', '-']
    end
  end

  describe('#secret_word') do
    it 'returns the letters of the secret word' do
      expect(word_keeper.secret_word).to eq ['t', 'e', 'a', 'c', 'u', 'p']
    end
  end

end
