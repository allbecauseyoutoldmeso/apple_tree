require 'word_maker'

describe WordMaker do

  subject(:word_maker) { described_class.new }

  describe '#get_word' do
    it 'returns a word' do
      expect(word_maker.get_word(6)).to be_a(String)
    end
    it 'returns a word of the specified length' do
      expect(word_maker.get_word(6).length).to eq 6
    end
  end

  describe '#get_definition' do
    it 'returns the definition of a word' do
      expect(word_maker.get_definition('toaster')).to eq 'an electrical device for making toast.'
    end
    it 'returns a message if no definition available' do
      expect(word_maker.get_definition('jupati')).to eq 'no definition available from oxford dictionaries.'
    end
  end

end
