@num = rand(10)
@num2 = rand(10)
@whos_turn = 1


def ask_question

  puts "what is #{@num} + #{@num2} ?"

  puts "Player #{@whos_turn}, please give your answer"
  response = gets.chomp.to_i 

  compare(response)

end



def compare(response) 

  if response == @num+@num2
    p 'right'
  else
    p 'wrong'
  end

end

ask_question
