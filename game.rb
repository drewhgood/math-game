
class Player

  attr_accessor :name, :lives_remaining, :cumulative_score

  def initialize
    @lives_remaining = 3
    @cumulative_score = 0
    @name=''
  end


  def lose_life
    @lives_remaining -= 1
  end

  def add_win
    @cumulative_score += 1
  end

  def reset_lives_remaining
    @lives_remaining = 3
  end

  def set_name (name)
    @name = name 
  end


end






def initialize_game(need_new_names)

 

  if need_new_names

    @p1 = Player.new
    @p2 = Player.new

    p'Before we get started, I need your names.'

    puts 'What is your name, player 1?'
    
    n1 = gets.chomp
    @p1.set_name(n1) 
    puts 'What is your name, player 2?'
    n2 = gets.chomp
    @p2.set_name(n2) 



  end



   @p1.reset_lives_remaining
   @p2.reset_lives_remaining
   @whos_turn = 1


  generate_question
  
end



 @whos_turn = 1 #1 represents player 1



def generate_question
  n1 = rand(5)
  n2 = rand(5)

  @answer = n1 + n2

  
  question= "#{@whos_turn == 1 ? @p1.name : @p2.name}, what is #{n1} + #{n2} ?"
  
  ask_question(question)
end


def ask_question(question)
  p question
  collect_input
end


def collect_input 
  response = gets.chomp.to_i
  evaluate_response(response)
end


def evaluate_response(response)
 correct = (response == @answer)
 update_state(correct)
end

def update_state(correct)
  
  if correct == false
    
    @whos_turn == 1 ?  @p1.lives_remaining -= 1 : @p2.lives_remaining -= 1

  end

  #update turn
  @whos_turn == 1 ? @whos_turn = 2 : @whos_turn = 1

  #check if game over
  if @p1.lives_remaining == 0 || @p2.lives_remaining == 0
    end_game
  else
    scoreboard
  end

end


def scoreboard

  p "#{@p1.name}: (#{@p1.lives_remaining})pts | Player #{@p2.name}: (#{@p2.lives_remaining})pts"
  generate_question

end


def end_game
   p @p1.lives_remaining == 0 ? "#{@p2.name} wins!"  : "#{@p1.name} wins!"
   @p1.lives_remaining == 0 ? @p2.add_win  : @p1.add_win


   cumulative_scoreboard

   p 'Would you like to play again (Y/N)?'
   response = gets.chomp.downcase
   
   if response == 'y'
    initialize_game(false)
    
   else
    p 'Thanks for playing!'
   end

end


def cumulative_scoreboard
  # add point when player wins a game
  p "This sessions score: #{@p1.name} - #{@p1.cumulative_score}(wins)  |  #{@p2.name} - #{@p2.cumulative_score}(wins)"

end





 initialize_game(true)
