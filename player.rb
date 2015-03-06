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

end

