require_relative 'HangMan.rb'
require 'pry'

class Game

  def initialize
    @new = HangMan.new
  end

  def start_game
    print 'to start a new game, type (1) - to load the previously saved game, type (2): '
    ans = gets.chomp
    puts ''
    if ans == '1'
      @new.game
    elsif ans == '2'
      load_game
    end
  end

  def load_game
    game = YAML.load(File.read('previous_game.txt'))
    game.game
  end
end

x = Game.new
x.start_game
