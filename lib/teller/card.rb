module Teller
  class Card
    class UnknownCard < StandardError; end

    attr_accessor :value, :suit

    def self.parse(card_code)
      value_code, suit_code = card_code.split('')
      self.new(value_from_code(value_code), suit_from_code(suit_code))
    end

    def initialize(value, suit)
      @value = value
      @suit = suit
      raise UnknownCard.new("Unknown card #{value}-#{suit}") unless @value >= 2 && @suit >= 1 && @value <= 14 && @suit <= 4
    end

    private

    def self.value_from_code(code)
      case code
      when 'A'
        14
      when 'K'
        13
      when 'Q'
        12
      when 'J'
        11
      when 'T'
        10
      else
        code.to_i
      end
    end

    def self.suit_from_code(code)
      case code
      when 'S'
        4
      when 'H'
        3
      when 'D'
        2
      when 'C'
        1
      else
        0
      end
    end

  end
end