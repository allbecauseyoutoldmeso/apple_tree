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

end
