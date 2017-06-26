require 'spec_helpers'

feature 'playing appletree' do

  scenario 'user can visit homepage and choose to start a game' do
    start_game
    expect(page).to have_content 'guess a letter'
  end

  scenario 'game starts with six empty dashes' do
    start_game
    expect(page).to have_content '------'
  end

  scenario 'when a correct letter is submitted it is added to the revealed word' do
    enter_correct_letter
    expect(page).to have_content 't-----'
  end

  scenario 'when an incorrect letter is submitted the revealed word doe not change' do
    enter_incorrect_letter
    expect(page).to have_content '------'
  end

  scenario 'a win message is displayed if all the letters are guessed' do
    win_game
    expect(page).to have_content 'you won!'
  end

  scenario 'a lose message is displayed if all the letters are guessed' do
    lose_game
    expect(page).to have_content 'you lose. the word was teacup.'
  end

  scenario 'when the word is revealed a definition is supplied' do
    win_game
    expect(page).to have_content 'Definition: a cup from which tea is drunk.'
  end

  scenario 'player can start a new game' do
    lose_game
    click_button 'play again'
    expect(page).to have_content 'guess a letter'
  end

end
