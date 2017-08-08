require 'word_maker'

describe WordMaker do

  subject(:word_maker) { described_class.new(6) }

  describe '#word' do
    it 'returns a word' do
      expect(word_maker.word).to be_a(String)
    end
    it 'the word is of the length specified on initiation' do
      expect(word_maker.word.length).to eq 6
    end
  end

  describe '#definition' do
    it 'returns a string' do
      expect(word_maker.definition).to be_a(String)
    end
  end

  describe '#get_word' do
    it 'returns a word' do
      expect(word_maker.get_word).to be_a(String)
    end
  end

  describe('#get_definition') do
    it 'gets a json string with a definition' do
    expect(JSON.parse(word_maker.get_definition('teacup').body)['results'][0]['lexicalEntries'][0]['entries'][0]['senses'][0]['definitions'][0]).to eq 'a cup from which tea is drunk.'
    end
  end

end
