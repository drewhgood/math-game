@whos_turn = 1
@player1_score = 3
@player2_score = 3



#logic
def generate_question
  n1 = rand(20)
  n2 = rand(20)
  p @answer = n1 + n2
  
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


  p "player 1 #{@player1_score}"
  p "player 2 #{@player2_score}"

 generate_question

end




generate_question
