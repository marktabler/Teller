module Teller
  class Hand

    def self.parse(hand_code)
      hand_code.split(/../).map { |card_code| Card.parse(card_code) }
    end

    def scoring_code

    end

    def <=>(other)
      scoring_code <=> other.scoring_code
    end

  end
end