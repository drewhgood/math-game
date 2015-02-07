
class Player

  attr_accessor :name, :lives_remaining

  def initialize (name)
    @name = name
    @lives_remaining = 3
  end


  def lose_life
    @lives_remaining -=1
  end

end

@p1 = Player.new('Drew')
@p2 = Player.new('Megan')


@whos_turn = @p1


def generate_question
  n1 = rand(5)
  n2 = rand(5)

  @answer = n1 + n2
  
  question= "#{@whos_turn.name}, what is #{n1} + #{n2} ?"
  
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
    
    @whos_turn == @p1 ?  @p1.lives_remaining -= 1 : @p2.lives_remaining -= 1

  end

  #update turn
  @whos_turn == @p1 ? @whos_turn = @p2 : @whos_turn = @p1

  #check if game over
  if @player1_score == 0 || @player2_score == 0
    end_game
  else
    scoreboard
  end

end


def scoreboard
  p "#{@p1.name}: (#{@p1.lives_remaining})pts | Player #{@p2.name}: (#{@p2.lives_remaining})pts"
  #generate_question
end


 generate_question




# 
# @p1_cumulative_score = 0
# @p2_cumulative_score = 0















# #output
# def cumulative_scoreboard
#   # add point when player wins a game
#   p "This sessions score: #{@p1_name} - #{@p1_cumulative_score}(wins)  |  #{@p2_name} - #{@p2_cumulative_score}(wins)"
# end


# #output
# def end_game
#    p @player1_score == 0 ? "Player #{@p2_name} wins!"  : "Player #{@p1_name} wins!"
#    @player1_score == 0 ? @p2_cumulative_score += 1  : @p1_cumulative_score += 1


#    cumulative_scoreboard

#    p 'Would you like to play again (Y/N)?'
#    response = gets.chomp.downcase
   
#    if response == 'y'
#     initialize_game(@p1_name, @p2_name)
    
#    else
#     p 'Thanks for playing!'
#    end

# end

# #IO
# def pre_initialize_game

#   p'Before we get stated, I need your names.'

#   puts 'What is your name, player 1?'
#   player1 = gets.chomp 
#   puts 'What is your name, player 2?'
#   player2 = gets.chomp

#   initialize_game(player1, player2)

# end



# #logic
# def initialize_game(player1, player2)
#   @whos_turn = 1
#   @player1_score = 3
#   @player2_score = 3
#   @p1_name = player1
#   @p2_name = player2

#   generate_question
# end






# pre_initialize_game
