def start_intermediate_game
  visit('/')
  click_button 'intermediate'
end

def start_easy_game
  visit('/')
  click_button 'easy'
end

def start_difficult_game
  visit('/')
  click_button 'difficult'
end

def enter_correct_letter
  start_testgame
  submit_letter('t')
end

def enter_incorrect_letter
  start_testgame
  submit_letter('x')
end

def win_game
  start_testgame
  ['t','e','a','c','u','p'].each { |letter| submit_letter(letter) }
end

def lose_game
  start_testgame
  ['w','x','f','y','m','l','d','r','h','k'].each { |letter| submit_letter(letter) }
end

def submit_letter(letter)
  fill_in :guess, with: letter
  click_button 'guess'
end

def start_testgame
  page.set_rack_session(game: Game.new(Teacup.new))
  visit '/game'
end

class Teacup
  def word
    'teacup'
  end
  def definition
    'a cup from which tea is drunk.'
  end
end
