x = 1
@p1_lives = 3
@p2_lives = 3


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
  p response == @answer
end




while x > 0
  generate_question
  ask_question 
  evalutate_response(gather_response) 
  

  x = 0
end