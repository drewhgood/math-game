require 'colorize'
#game state values
@whos_turn = 1
@playing = true

#p1 refers to player 1, and p2 refers to player 2.
@p1_lives = 3
@p2_lives = 3
@p1_name ='' 
@p2_name =''


def set_player_names
  ask_for_name
  @p1_name = collect_name
  
  #update turn to ask the right player for their name
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


def turn_name
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
  if @whos_turn == 1
    @p1_lives -= 1
  else
    @p2_lives -= 1
  end  
end


def check_for_winner
  if @p1_lives == 0 
    puts "#{@p2_name} wins!".blue.on_red.blink
    @playing = false

  elsif @p2_lives == 0
    puts "#{@p1_name} wins!".blue.on_red.blink
    @playing = false
  end  
end


while @playing
  set_player_names if @p1_name.empty?
  generate_question
  ask_question 
  correct_response = evalutate_response(gather_response)
  notify_right_or_wrong(correct_response)

  if !correct_response
    update_lives
  end

  check_for_winner
  update_turn

end