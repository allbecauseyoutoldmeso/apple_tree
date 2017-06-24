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

  describe('#secret_word_includes?') do
    it 'returns the letters of the secret word' do
      expect(word_keeper.secret_word_includes?('p')).to eq true
    end
  end

  describe('#reveal_letters') do
    it 'reveals instances of the proposed letter' do
      word_keeper.reveal_letters('c')
      expect(word_keeper.revealed_word).to eq ['-', '-', '-', 'c', '-', '-']
    end
  end

  describe('#guessed_word?') do
    it 'returns false if not all letters are revealed' do
      ['t','e','a'].each { |letter| word_keeper.reveal_letters(letter) }
      expect(word_keeper.guessed_word?).to eq false
    end
    it 'returns true if all letters are revealed' do
      ['t','e','a','c','u','p'].each { |letter| word_keeper.reveal_letters(letter) }
      expect(word_keeper.guessed_word?).to eq true
    end
  end

end
