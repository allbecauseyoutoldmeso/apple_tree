require 'dash'

describe Dash do

  subject(:dash) { described_class.new('t') }

  describe '#revealed_symbol' do
    it 'is initially a dash' do
      expect(dash.revealed_symbol).to eq '-'
    end
  end

  describe '#letter' do
    it 'returns the secret letter' do
      expect(dash.letter).to eq 't'
    end
  end

  describe '#reveal_letter' do
    it 'reveals the letter' do
      dash.reveal_letter
      expect(dash.letter).to eq 't'
    end
  end

end
