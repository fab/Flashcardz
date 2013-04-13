class Dealer
  attr_reader :guess, :deck, :drawn_card

  def initialize(deck)
    @deck = deck
  end

  def play!
    View.welcome
    guess_loop_on_deck
    View.exit
  end

  private

  def guess_loop_on_deck
    until deck.empty?
      card = deck.draw!
      View.display_definition(card)
      guess_loop_on_one_card(card)
      View.print_correct
    end
  end

  def guess_loop_on_one_card(card)
    while true
      guess = View.prompt_guess
      return if card.correct_guess?(guess)
      View.print_incorrect
    end
  end
end

class View

  private

  def self.prompt_guess
    puts "Guess:"
    gets.chomp    
  end

  def self.print_correct
    puts "Correct!"
    puts
  end

  def self.print_incorrect
    puts "Incorrect! Try again."
    puts
  end

  def self.display_definition(card)
    puts card.definition
  end

  def self.welcome
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition. Ready? Go!"
    puts
  end

  def self.exit
    puts "That's all the cards. Thanks for playing!"
  end
end

class Deck
  def initialize(filename)
    @card_db = []
    parse(filename)
  end

  def empty?
    @card_db.empty?
  end

  def draw!
    raise "Deck is empty" if empty?
    @card_db.shuffle!.pop
  end

  private

  def parse(filename)
    array = File.readlines(filename, :quote_char => "\x00").map do |line|
      line.split("\n").delete_if {|string| string == " " } 
    end
    array.delete_if {|item| item == []}
    hash = Hash[*array.flatten]
    hash.each {|k, v| @card_db << Card.new(k,v) }
  end
end

class Card
  attr_reader :definition

  def initialize(definition, answer)
    @definition = definition
    @answer = answer
  end

  def correct_guess?(guess)
    @answer == guess
  end
end

my_deck = Deck.new('flashcard_samples.txt')
Dealer.new(my_deck).play!

