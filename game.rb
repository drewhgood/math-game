x = 1
@p1_lives = 3
@p2_lives = 3
@whos_turn = 1


def generate_question
  @number_1 = rand(20)
  @number_2 = rand(20)
  @answer = @number_1 + @number_2  
end


def ask_question
  print "What is  #{@number_1} + #{@number_2}?"
end


def gather_response
  resonse = gets.chomp.to_i
end


def evalutate_response(response)
  response == @answer
end


def notify_right_or_wrong(correct_response)
  if correct_response
    p 'Correct Response!'
  else
    p 'Sorry, that is wrong.'
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




while x > 0
  generate_question

  ask_question 

  correct_response = evalutate_response(gather_response)

  notify_right_or_wrong(correct_response)

  update_lives

  update_turn




  x = 0
end