module Teller
  module Scoring

    SCORING_METHODS = [:royal_flush, :straight_flush, :quads, :full_house, 
                       :flush, :straight, :trips, :two_pair, :pair, :high]
    
    class InvalidScoringHand < StandardError
    
    def caluclated_scoring_code
      raise InvalidScoringHand unless cards.size == 5
      best_hand_score
    end

    def best_hand_score
      SCORING_METHODS.map do |method|
        self.send(method)
      end.max
    end

    private

    def royal_flush
    end
    
  end
end