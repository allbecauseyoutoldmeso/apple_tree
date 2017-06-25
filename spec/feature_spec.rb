feature 'playing appletree' do

  scenario 'user can visit homepage and choose to start a game' do
    visit('/')
    click_button 'play game'
    expect(page).to have_content 'guess a letter'
  end
end
