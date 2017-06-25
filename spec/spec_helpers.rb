def start_game
  visit('/')
  click_button 'play game'
end

def enter_correct_letter
  visit '/testgame'
  submit_letter('t')
end

def enter_incorrect_letter
  visit '/testgame'
  submit_letter('x')
end

def win_game
  visit '/testgame'
  ['t','e','a','c','u','p'].each { |letter| submit_letter(letter) }
end

def lose_game
  visit '/testgame'
  ['w','x','f','y','m','l','d','r','h','k'].each { |letter| submit_letter(letter) }
end

def submit_letter(letter)
  fill_in :guess, with: letter
  click_button 'guess'
end
