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

  describe('#console feedback') do
    it 'output a string representing the revealed letters to the console' do
      expect { game.console_feedback }.to output("------\n").to_stdout
    end
    it 'returns a lose message after ten incorrect guesses' do
      ['w','x','f','y','m','l','d','r','h','k'].each { |letter| game.guess(letter) }
      expect { game.console_feedback }.to output("------\nyou lose!\n").to_stdout
    end
    it 'returns a win message if the whole word is revealed' do
      ['t','e','a','c','u','p'].each { |letter| game.guess(letter) }
      expect { game.console_feedback }.to output("teacup\nyou win!\n").to_stdout
    end
  end





end
