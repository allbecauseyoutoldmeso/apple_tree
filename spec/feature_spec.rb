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

  # scenario 'game starts with ten apples' do
  #   start_game
  #   expect(page).to have_css("img[src*='/apple.png']")
  # end

  scenario 'when a correct letter is submitted it is added to the revealed word' do
    visit '/testgame'
    fill_in :guess, with: 't'
    click_button 'guess'
    expect(page).to have_content 't-----'
  end

  # scenario 'when an incorrect letter is submitted the apples are decreased by one' do
  #   visit '/testgame'
  #   fill_in :guess, with: 'x'
  #   click_button 'guess'
  #   expect(page).to have_css(..?)
  # end

end
