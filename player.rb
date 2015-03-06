class Player

  attr_accessor :name, :lives, :wins

  def initialize(name)
    @name = name
    @lives = 3
    @wins = 0
  end

  def add_win
    @wins += 1
  end

  def lose_life
    @lives -= 1
  end

  def reset_lives
    @lives = 3
  end

end

