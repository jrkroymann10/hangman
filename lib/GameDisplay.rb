require 'pry'

class GameDisplay
  attr_accessor :display, :letters_used, :turns
  attr_reader :word, :turns_display
  def initialize
    @word = random_word_generator.downcase
    @letters_used = ' | words used:'
    @turns = 7
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
  
  def update_board(letter)
    if @word.include? letter
      temp = ((@word.index(letter) + 1) * 2) - 1
      @display[temp] = letter
    else 
      update_letters_used(letter)
    end
    @turns -= 1
  end

  def view_board
    puts @display + @turns_display + letters_used
  end

  private

  def update_letters_used(letter)
    @letters_used += " #{letter}"
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


end

x = GameDisplay.new
puts x.display
x.update_board('a')
x.view_board
