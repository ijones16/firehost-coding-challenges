class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end  

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    @ranks = (1..13).to_a
    @suits = [:spades, :clubs, :diamonds, :hearts]
    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    puts "#{self.cards.first.rank} of #{self.cards.first.suit} has been dealt"
    self.cards.shift
  end

  def output
    @cards.each do |card|
      card.output_card
    end
  end
end

deck = Deck.new
deck.shuffle
deck.deal