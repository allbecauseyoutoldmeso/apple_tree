feature 'game is initiated' do

  scenario 'game starts when user visits homepage' do
    visit('/')
    expect(page).to have_content '------'
  end
end
