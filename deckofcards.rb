class Deck
  attr_reader :card_db

  def initialize(filename)
    @card_db = []
    @correct_array = []
    @wrong_array = []
    parse(filename)
  end

  def correct_count
    @correct_array.length
  end

  def wrong_count
    @wrong_array.length
  end


  def correct?(user_answer, actual_answer)
    user_answer == actual_answer
  end

  # def draw_card
  #   @card_db.shuffle.pop
  # end

  def parse(filename)
    array = []
    File.readlines(filename, :quote_char => "\x00").each do |line|
      array << line.split("\n").delete_if {|string| string == " "}
    end
    array.delete_if {|item| item == []}
    hash = Hash[*array.flatten]
    hash
    hash.each {|k, v| @card_db << Card.new(k,v) }
  end

end

class Card
  attr_reader :definition, :answer

  def initialize(definition, answer)
    @definition = definition
    @answer = answer
  end
end


  # stephen = Deck.new
  # stephen.parse('flashcard.csv')
  # puts stephen.card_db.inspect
