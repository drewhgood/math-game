def generate_question
  n1 = rand(20)
  n2 = rand(20)
  p @answer = n1 + n2
  
  question= "What is #{n1} + #{n2} ?"
  
  ask_question(question)
end


def ask_question(question)
  p question
  collect_input
end



def collect_input 
  response = gets.chomp.to_i
  evaluate_answer(response)
end


def evaluate_answer(response)
 p response == @answer

 generate_question
end



generate_question
