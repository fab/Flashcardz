class Deck
  # attr_reader :card_db

  def initialize(filename)
    @card_db = []
    parse(filename)
  end

  def empty?
    card_db.empty?
  end

  def draw!
    raise "Deck is empty" if empty?

    card_db.shuffle!.pop
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
