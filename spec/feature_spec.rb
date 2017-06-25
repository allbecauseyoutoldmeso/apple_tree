require 'spec_helpers'

feature 'playing appletree' do

  scenario 'user can visit homepage and choose to start a game' do
    visit('/')
    click_button 'play game'
    expect(page).to have_content 'guess a letter'
  end

  scenario 'game starts with six empty dashes' do
    start_game
    expect(page).to have_content '------'
  end

  scenario 'when a correct letter is submitted it is added to the revealed word' do
    visit '/testgame'
    fill_in :guess, with: 't'
    click_button 'guess'
    expect(page).to have_content 't-----'
  end

  scenario 'a win message is displayed if all the letters are guessed' do
    win_game
    expect(page).to have_content 'you won!'
  end

  scenario 'a lose message is displayed if all the letters are guessed' do
    lose_game
    expect(page).to have_content 'you lose. the word was teacup.'
  end

end
