require './deckofcards.rb'

class Dealer
  attr_reader :guess, :deck, :drawn_card

  def initialize(deck)
    @deck = deck
  end

  def play!
    welcome
    guess_loop_on_deck
    exit
  end

  private

  # should someone be able to tell the dealer to do this?
  def prompt_guess
    puts "Guess:"
    gets.chomp    
  end

# should someone be able to tell the dealer to do this?
  def print_correct
    puts "Correct!"
    puts
  end
# should someone be able to tell the dealer to do this?
  def print_incorrect
    puts "Incorrect! Try again."
    puts
  end
# should someone be able to tell the dealer to do this?
  
# should someone be able to tell the dealer to do this?
  def display_definition(card)
    puts card.definition
  end
# should someone be able to tell the dealer to do this?
  def welcome
    puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition. Ready? Go!"
    puts
  end
# should someone be able to tell the dealer to do this?
  def exit
    puts "That's all the cards. Thanks for playing!"
  end

# should someone be able to tell the dealer to do this?
  def guess_loop_on_deck
    # why does dealer know that card_db is eventually an empty array? what it it was a hash? or a linked_list? or something else?
    until deck.empty?
      card = deck.draw!
      display_definition(card)
      guess_loop_on_one_card(card)
      print_correct
    end
  end
  # should someone be able to tell the dealer to do this?
  def guess_loop_on_one_card(card)
    while true
      guess = prompt_guess
      return if card.correct_guess?(guess)
      print_incorrect
    end
  end

end

my_deck = Deck.new('flashcard_samples.txt')
Dealer.new(my_deck).play!

