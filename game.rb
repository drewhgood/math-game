@num = rand(10)
@num2 = rand(10)
@whos_turn = 1
@player1_score = 3
@player2_score = 3


def ask_question

  puts "what is #{@num} + #{@num2} ?"

  puts "Player #{@whos_turn}, please give your answer"
  response = gets.chomp.to_i 

  compare(response)

end



def compare(response) 

  if response == @num+@num2
    p 'You are correct!'

  else
    p 'Sorry, that is wrong. You lost a point!'
    point_loser = @whos_turn == 1 ? 1 : 2
  end

  update_state(point_loser)

end



def update_state(point_loser)

  point_loser == 1 ? @player1_score -= 1 : @player2_score -= 1 

#toggle players turn after question
  @whos_turn == 1 ? @whos_turn = 2 : @whos_turn = 1

  announce_score

end


def announce_score

  puts "Score | Player 1: #{@player1_score}  Player 2: #{@player2_score}"

end




ask_question
