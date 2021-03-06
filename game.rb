require 'colorize'
require_relative 'player'

#game state values####
@whos_turn = 1
@playing = true


def create_players
  ask_for_name
  @p1 = Player.new(collect_name)
  update_turn

  ask_for_name
  @p2 = Player.new(collect_name)
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
  @whos_turn == 1 ? @p1.name : @p2.name
end


def ask_question
  puts "\n#{turn_name}, what is  #{@number_1} + #{@number_2}?"
end


def gather_response
  resonse = gets.chomp.to_i
end


def evalutate_response(response)
  response == @answer
end


def notify_right_or_wrong(correct_response)
  if correct_response
    puts "\n#{turn_name}, that is a correct response!".colorize(:green)
  else
    puts "\n#{turn_name}, that's wrong! Better luck next time.".colorize(:red)
  end
end


def update_turn
  @whos_turn == 1 ? @whos_turn = 2 : @whos_turn = 1
end


def update_lives
  @whos_turn == 1 ? @p1.lose_life :  @p2.lose_life
end


def update_wins(player)
  player == 1 ? @p1.add_win : @p2.add_win
end


def check_for_winner
  if @p1.lives == 0 
    2
  elsif @p2.lives == 0
    1
  else
    nil
  end  
end


def announce_winner(player)
  if player == 1
   puts "\n#{@p1.name} wins!\n".colorize(:green)
  else
   puts "\n#{@p2.name} wins!\n".colorize(:green)
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


def wins_scoreboard
  puts "#{@p1.name} : #{@p1.wins} total wins."
  puts "#{@p2.name} : #{@p2.wins} total wins."
end


def show_scoreboard
  puts "#{@p1.name} : #{@p1.lives}pts  |  #{@p2.name} : #{@p2.lives}pts"
end


def reset_game_state
  @p1.reset_lives
  @p2.reset_lives
  @whos_turn = 1
end


def play
  while @playing
    create_players if !@p1
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
      update_wins(winner)
      wins_scoreboard
      quit_or_restart(play_again)
    end
       
  end
  puts "Thank you for playing!"
end

play

