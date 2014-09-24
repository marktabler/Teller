module Teller
  class Deck

    STANDARD_DECK = %w(AS KS QS JS TS 9S 8S 7S 6S 5S 4S 3S 2S
                       AH KH QH JH TH 9H 8H 7H 6H 5H 4H 3H 2H
                       AD KD QD JD TD 9D 8D 7D 6D 5D 4D 3D 2D
                       AC KC QC JC TC 9C 8C 7C 6C 5C 4C 3C 2C)

    attr_accessor :cards
    
    def initialize
      @cards = STANDARD_DECK.map { |code| Card.parse(code) }.shuffle
    end

  end
end