require 'dictionary_manager'

describe DictionaryManager do

  subject(:dictionary_manager) { described_class.new }

  describe '#get_definition' do
    it 'returns the definition of a word' do
      expect(dictionary_manager.get_definition('toaster')).to eq 'an electrical device for making toast.'
    end
    it 'returns a message if no definition available' do
      expect(dictionary_manager.get_definition('jupati')).to eq 'no definition available from oxford dictionaries.'
    end
  end

end
