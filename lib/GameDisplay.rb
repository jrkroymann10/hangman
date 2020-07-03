require 'pry'

class GameDisplay
  attr_accessor :display, :letters_used, :turns, :turns_display
  attr_reader :word
  def initialize
    @word = random_word_generator.downcase
    @letters_used = ' | letters used:'
    @turns = 12
    @turns_display = " | turns left: #{@turns}"
    @display = '|'
    for i in 0...@word.length
      @display += ' _'
    end
  end

  def random_word_generator
    words = File.readlines '5desk.txt' # converts text into an array of all words
    words = clean_words(words)
    words = get_correct_length(words)
    temp = rand(0...words.length)
    words[temp]
  end
  
  def update_board(guess)
    if guess.length == 1
      if @word.include? guess
        correct_letter_guess(guess)
      else 
        incorrect_letter_guess(guess)
      end
    else
      win_check(guess)
    end
    @turns = @turns - 1
    update_turns_display
  end

  def view_board
    puts @display + @turns_display + letters_used
  end

  private

  def view_word
    show_word
    view_board
  end

  def update_letters_used(letter)
    @letters_used += " #{letter}"
  end

  def update_turns_display
    @turns_display = " | turns left: #{@turns}"
  end

  def clean_words(words)
    words.each do |word|
      word.tr!("\r\n", '')
    end
  end

  def get_correct_length(words)
    correct_words = []
    words.each do |word|
      if word.length >= 5 && word.length <= 12
        correct_words.push(word)
      end
    end
    correct_words
  end

  def show_word
    for i in 0...@word.length
      temp = ((i + 1) * 2)
      @display[temp] = @word[i]
    end
  end

  def win_check(guess)
    if guess == @word
      puts ''
      puts "congrats! you've guessed the correct pattern!"
      puts ''
      view_word
      puts '---------------------------------------------------------------------------------------------------------------------------'
    else 
      puts ''
      puts 'keep on trying!'
      puts '---------------------------------------------------------------------------------------------------------------------------'
    end
  end

  def correct_letter_guess(guess)
    puts ''
    puts 'solid guess!'
    puts '-----------------------------------------------------------------------------------------------------------------------------'
    places = []
    for i in 0...@word.length
      if @word[i] == guess
        places.push(i)
      end
    end
    for i in 0...places.length
      temp = (places[i] + 1) * 2 
      @display[temp] = guess
    end
  end

  def incorrect_letter_guess(guess)
    puts ''
    puts 'not this time!'
    puts '-----------------------------------------------------------------------------------------------------------------------------'
    update_letters_used(guess)
  end
end
