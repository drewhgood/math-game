require 'colorize'

#game state values####
@whos_turn = 1
@playing = true
@p1_lives = 3
@p2_lives = 3
@p1_name ='' 
@p2_name =''
@p1_lifetime_score = 0
@p2_lifetime_score = 0
######################


def set_player_names
  ask_for_name
  @p1_name = collect_name
  update_turn

  ask_for_name
  @p2_name = collect_name
  update_turn
end


def ask_for_name
  p "Please enter your name, player #{@whos_turn}?"
end



def collect_name
  gets.chomp
end



def generate_question
  @number_1 = rand(20)
  @number_2 = rand(20)
  @answer = @number_1 + @number_2  
end


def turn_name #Player's name who's turn it is.
  @whos_turn == 1 ? @p1_name : @p2_name
end


def ask_question
  puts "#{turn_name}, what is  #{@number_1} + #{@number_2}?"
end


def gather_response
  resonse = gets.chomp.to_i
end


def evalutate_response(response)
  response == @answer
end


def notify_right_or_wrong(correct_response)
  if correct_response
    puts "#{turn_name}, that is a correct response!".colorize(:green)
  else
    puts "#{turn_name}, that's wrong! Better luck next time.".colorize(:red)
  end
end


def update_turn
  @whos_turn == 1 ? @whos_turn = 2 : @whos_turn = 1
end


def update_lives
  @whos_turn == 1 ? @p1_lives -= 1 :  @p2_lives -= 1
end


def update_lifetime_score(player)
  player == 1 ? @p1_lifetime_score += 1 : @p2_lifetime_score += 1
end


def check_for_winner
  if @p1_lives == 0 
    2
  elsif @p2_lives == 0
    1
  else
    nil
  end  
end


def announce_winner(player)
  if player == 1
   puts "#{@p1_name} wins!"
  else
   puts "#{@p2_name} wins!"
  end
end


def play_again
  puts "Play again? (Y/N)"
  response = gets.chomp.downcase
  response == 'y' ? true : false
end


def quit_or_restart(play_again)
  if play_again
    reset_game_state
    @playing = true
  else
    @playing = false
  end
end


def lifetime_scoreboard
  puts "#{@p1_name} : #{@p1_lifetime_score} total wins."
  puts "#{@p2_name} : #{@p2_lifetime_score} total wins"
end


def show_scoreboard
  puts "#{@p1_name} : #{@p1_lives}pts  |  #{@p2_name} : #{@p2_lives}pts"
end


def reset_game_state
  @p1_lives = 3
  @p2_lives = 3
  @whos_turn = 1
end


while @playing
  set_player_names if @p1_name.empty?

  generate_question
  ask_question 
  correct_response = evalutate_response(gather_response)
  notify_right_or_wrong(correct_response)

  update_lives if !correct_response

  update_turn
  show_scoreboard
  
  if check_for_winner #checks if there is a winner.
    winner = check_for_winner
    announce_winner(winner)
    update_lifetime_score(winner)
    lifetime_scoreboard
    quit_or_restart(play_again)
  end
     
end

puts "Thank you for playing!"