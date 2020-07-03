require 'pry'

class HumanGuesser
  attr_reader :name
  attr_accessor :letters
  def initialize(name = 'human')
    @name = name
    @letters = []
  end

  def guess_word
    puts ''
    print "would you like to guess the word (w), guess a letter (l), or save the game (save), #{@name}? "
    ans = gets.chomp.downcase
    ans = check_answer(ans)
    if ans == 'w'
      puts ''
      print "make your guess, #{@name}: "
      guess = gets.chomp.downcase
    elsif ans == 'l'
      guess = guess_letter
      @letters.push(guess)
    elsif ans == 'save'
      guess = 'save'
    end
    guess
  end

  private

  def guess_letter
    guess = ''
    while guess.length != 1
      puts ''
      print "your guess, #{@name} (one letter): "
      guess = gets.chomp.downcase
    end
    guess
  end

  def check_answer(ans)
    while ans != 'w' && ans != 'l' && ans != 'save'
      print "would you like to guess the word (w), guess a letter (l), or save the game (save), #{@name}? (type w, l, or save) "
      ans = gets.chomp.downcase
    end
    ans
  end
end
