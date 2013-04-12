class Dealer
  attr_reader :guess, :deck, :drawn_card

  def initialize(deck)
    @deck = deck
  end

  def prompt_guess
    puts "Guess:"
    @guess = gets.chomp    
  end

  def print_correct
    puts "Correct!"
  end

  def print_incorrect
    puts "Incorrect! Try again."
  end

   def draw_card
    @drawn_card = deck.pop
  end

  def display_definition(drawn_card)
    puts drawn_card.definition
  end

  def welcome
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition. Ready? Go!"
  end

  def exit
    puts "That's all the cards. Thanks for playing!"
  end

  def guess_loop_on_one_card
    until drawn_card.correct?(guess)
      print_incorrect
      prompt_guess
    end
  end

  def guess_loop_on_deck
    # while deck.card_db != []
    while deck != []
      draw_card
      display_definition(drawn_card)
      prompt_guess
      guess_loop_on_one_card
      print_correct
    end
  end

  def play!
    welcome
    guess_loop_on_deck
    exit
  end
end

class Card
  attr_reader :definition, :answer

  def initialize(definition, answer)
    @definition = definition
    @answer = answer 
  end

  def correct?(guess)
    guess == answer
  end
end

deck = [Card.new('A file format in which values are delimited by commas.', 'CSV'), Card.new('Test definition', 'Some answer')]
Dealer.new(deck).play!
