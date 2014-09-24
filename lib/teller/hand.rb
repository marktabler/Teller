module Teller
  class Hand
    extend Scoring

    attr_accessor :cards

    def self.parse(hand_code)
      cards = hand_code.scan(/../).map { |card_code| Card.parse(card_code) }
      self.new(cards)
    end

    def initialize(cards)
      @cards = cards
    end

    def scoring_code
      @scoring_code ||= calculated_scoring_code
    end

    def to_s
      cards.map(&:to_s).join('')
    end

    def <=>(other)
      scoring_code <=> other.scoring_code
    end

  end
end