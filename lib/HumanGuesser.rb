class HumanGuesser
  attr_reader :name
  attr_accessor :letters
  def initialize(name = 'human')
    @name = name
    @letters = []
  end

  def guess_word
    puts ''
    print "would you like to guess the word, #{@name}? (y/n) "
    ans = gets.chomp.downcase
    ans = check_answer(ans)
    if ans == 'y'
      puts ''
      print "make your guess, #{@name}: "
      guess = gets.chomp.downcase
    elsif ans == 'n'
      guess = guess_letter
      @letters.push(guess)
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
    while ans != 'y' && ans != 'n'
      print "would you like to guess the word, #{@name}? (y/n) "
      ans = gets.chomp.downcase
    end
    ans
  end
end
