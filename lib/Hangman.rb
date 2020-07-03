require_relative 'GameDisplay.rb'
require_relative 'HumanGuesser.rb'

class Hangman
  attr_accessor :turns
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
    @game_display.update_board(guess)
    win_check
    lose_check
  end

  def win_check
    if !@game_display.display.include? '_'
      @turns = 0
    end
  end

  def lose_check
    if (@game_display.display.include? '_') && (turns == 1)
      @game_display.view_board
      puts ''
      puts "better luck next time! the correct word was #{@game_display.word}"
      puts '------------------------------------------------------------'
    end
  end
end

x = Hangman.new
x.game

