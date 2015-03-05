def generate_question
  number_1 = rand(20)
  number_2 = rand(20)
  @answer = number_1 + number_2

  print "What is  #{number_1} + #{number_2}?"  
end
