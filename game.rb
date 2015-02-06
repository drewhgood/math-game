

@whos_turn = 1
@player1_score = 3
@player2_score = 3
@p1_name = ''
@p2_name = ''
@p1_cumulative_score = 0
@p2_cumulative_score = 0




#logic
def generate_question
  n1 = rand(20)
  n2 = rand(20)

  @answer = n1 + n2
  
  question= "Player #{@whos_turn == 1 ? @p1_name : @p2_name}, what is #{n1} + #{n2} ?"
  
  ask_question(question)
end

#output
def ask_question(question)
  p question
  collect_input
end


#input
def collect_input 
  response = gets.chomp.to_i
  evaluate_answer(response)
end


#logic
def evaluate_answer(response)
 correct = (response == @answer)
 update_state(correct)
end

#logic
def update_state(correct)
  
  if correct == false
    @whos_turn == 1 ? @player1_score -= 1 : @player2_score -= 1

  end
  #update turn
  @whos_turn == 1 ? @whos_turn = 2 : @whos_turn = 1

  #check if game over
  if @player1_score == 0 || @player2_score == 0
    end_game
  else
    scoreboard
  end

end


def scoreboard
  p "Player #{@p1_name}: (#{@player1_score})pts | Player #{@p2_name}: (#{@player2_score})pts"
  generate_question
end

def cumulative_scoreboard
  p "This sessions score: #{@p1_name} - #{@p1_cumulative_score}(wins)  |  #{@p2_name} - #{@p2_cumulative_score}(wins)"
end


#output
def end_game
   p @player1_score == 0 ? "Player #{@p2_name} wins!"  : "Player #{@p1_name} wins!"
   @player1_score == 0 ? @p2_cumulative_score += 1  : @p1_cumulative_score += 1


   cumulative_scoreboard

   p 'Would you like to play again (Y/N)?'
   response = gets.chomp.downcase
   
   if response == 'y'
    initialize_game(@p1_name, @p2_name)
    
   else
    p 'Thanks for playing!'
   end

end

#IO
def pre_initialize_game

  p'Before we get stated, I need your names.'

  puts 'What is your name, player 1?'
  player1 = gets.chomp 
  puts 'What is your name, player 2?'
  player2 = gets.chomp

  initialize_game(player1, player2)

end



#logic
def initialize_game(player1, player2)
  @whos_turn = 1
  @player1_score = 3
  @player2_score = 3
  @p1_name = player1
  @p2_name = player2

  generate_question
end






pre_initialize_game
