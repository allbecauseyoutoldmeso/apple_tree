require 'spec_helpers'

feature 'playing appletree' do

  scenario 'user can visit homepage and start an intermediate game' do
    start_intermediate_game
    expect(page).to have_content '------'
  end

  scenario 'user can visit homepage and start an easy game' do
    start_easy_game
    expect(page).to have_content '----'
  end

  scenario 'user can visit homepage and start a difficult game' do
    start_difficult_game
    expect(page).to have_content '--------'
  end

  scenario 'game starts with six empty dashes' do
    start_testgame
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

  scenario 'when an incorrect letter is submitted it is displayed on the page' do
    enter_incorrect_letter
    expect(page).to have_content 'x'
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
    expect(page).to have_content 'teacup: a cup from which tea is drunk.'
  end

  scenario 'player is redirected to the home page if they want to start a new game' do
    lose_game
    click_button 'play again'
    expect(page).to have_content 'try to guess the hidden word'
  end

end
