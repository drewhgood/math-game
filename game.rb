
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

    @player_1 = Player.new
    @player_2 = Player.new

    p'Before we get started, I need your names.'

    puts 'What is your name, player 1?'
    
    n1 = gets.chomp
    @player_1.set_name(n1) 
    puts 'What is your name, player 2?'
    n2 = gets.chomp
    @player_2.set_name(n2) 

  end


  @player_1.reset_lives_remaining
  @player_2.reset_lives_remaining
  @whos_turn = 1
  generate_question
  
end


 @whos_turn = 1 #1 represents player 1


def generate_question
  n1 = rand(5)
  n2 = rand(5)

  @answer = n1 + n2

  
  question= "#{@whos_turn == 1 ? @player_1.name : @player_2.name}, what is #{n1} + #{n2} ?"
  
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
    @whos_turn == 1 ?  @player_1.lives_remaining -= 1 : @player_2.lives_remaining -= 1
  end

  #update turn
  @whos_turn == 1 ? @whos_turn = 2 : @whos_turn = 1

  #check if game over
  if @player_1.lives_remaining == 0 || @player_2.lives_remaining == 0
    end_game
  else
    scoreboard
  end

end


def scoreboard

  p "#{@player_1.name}: (#{@player_1.lives_remaining})pts | Player #{@player_2.name}: (#{@player_2.lives_remaining})pts"
  generate_question

end


def end_game

   p @player_1.lives_remaining == 0 ? "#{@player_2.name} wins!"  : "#{@player_1.name} wins!"
     @player_1.lives_remaining == 0 ? @player_2.add_win  : @player_1.add_win

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
  p "This sessions score: #{@player_1.name} - #{@player_1.cumulative_score}(wins)  |  #{@player_2.name} - #{@player_2.cumulative_score}(wins)"
end


 initialize_game(true)
