@whos_turn = 1
@player1_score = 3
@player2_score = 3



#logic
def generate_question
  n1 = rand(20)
  n2 = rand(20)
  @answer = n1 + n2
  
  question= "Player #{@whos_turn}, what is #{n1} + #{n2} ?"
  
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
  
  unless correct 
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
  p "Player 1: (#{@player1_score})pts | Player 2: (#{@player2_score})pts"
  generate_question
end


#output
def end_game
 p @player1_score == 0 ? "Player 2 wins!" : "Player 1 wins!"
 p 'Would you like to play again (Y/N)?'
 response = gets.chomp.downcase
 
 if response == 'y'
  initialize_game 
  generate_question
 else
  p 'Thanks for playing!'
 end

end

def initialize_game

  @whos_turn = 1
  @player1_score = 3
  @player2_score = 3

end






generate_question
