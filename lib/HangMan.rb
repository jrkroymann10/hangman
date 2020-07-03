require_relative 'GameDisplay.rb'
require_relative 'HumanGuesser.rb'
require 'io/console'
require 'yaml'
require 'pry'

class HangMan
  attr_accessor :turns, :history, :guesser, :game_display
  def initialize
    @guesser = HumanGuesser.new
    @game_display = GameDisplay.new
    @turns = 12
  end

  def game
    while @turns > 0
      game_turn
      @turns -= 1
    end
  end

  private

  def game_turn
    @game_display.view_board
    guess = @guesser.guess_word
    if guess == 'save'
      save_game
    elsif guess == 'load'
      load_game
    end
    @game_display.update_board(guess)
    win_check
    lose_check
  end

  def win_check
    if !@game_display.display.include? '_'
      @turns = 0
      @game_display.view_board
      puts ''
      puts "congrats! you've guessed the correct pattern!"
    end
  end

  def lose_check
    if (@game_display.display.include? '_') && (turns == 1)
      @game_display.view_board
      puts ''
      puts "better luck next time! the correct word was #{@game_display.word}"
    end
  end

  public

  def save_game
    yaml = YAML.dump(self)
    file = File.new('previous_game.txt', 'w+')
    file.puts(yaml)
    file.close
    exit
  end
end

