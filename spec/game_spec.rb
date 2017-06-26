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
      expect(game.revealed_word).to eq '---c--'
    end
  end

  describe('#game_over?') do
    it 'is false initially' do
      expect(game.game_over?).to eq false
    end
    it 'returns true after ten incorrect guesses' do
      ['w','x','f','y','m','l','d','r','h','k'].each { |letter| game.guess(letter) }
      expect(game.game_over?).to eq true
    end
    it 'returns true if all the letters are correct' do
      ['t','e','a','c','u','p'].each { |letter| game.guess(letter) }
      expect(game.game_over?).to eq true
    end
  end

  describe('#final_message') do
    it 'returns a win message' do
      ['t','e','a','c','u','p'].each { |letter| game.guess(letter) }
      expect(game.final_message).to eq 'you won!'
    end
    it 'returns a lose message' do
      ['w','x','f','y','m','l','d','r','h','k'].each { |letter| game.guess(letter) }
      expect(game.final_message).to eq 'you lose. the word was teacup.'
    end
  end

  describe('#word_definition') do
    it 'returns a definition of the secret word' do
      expect(game.word_definition).to eq 'teacup: a cup from which tea is drunk.'
    end
  end

end
