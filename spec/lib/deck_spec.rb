
RSpec.describe Teller::Deck do

  context "#new" do
    let(:deck) { Teller::Deck.new }
    let(:sorted_deck) { Teller::Deck.new.unshuffle! }

    it "produces a shuffled 52-card deck" do
      
      expect(deck.cards.size).to eq 52
      expect(deck.cards.uniq.size).to eq 52
      expect(deck.cards).to_not eq(sorted_deck.cards)
    end
  end

  context "#to_s" do
    let(:hand) { Teller::Hand.parse('AHTS5D9CAD') }

    it "translates a hand's cards back into a code string" do
      expect(hand.to_s).to eq ('AHTS5D9CAD')
    end
  end

  context "#deal" do
    let(:deck) { Teller::Deck.new.unshuffle! }

    it "produces N cards" do
      expect(deck.deal!(5).size).to eq 5
      expect(deck.deal!(1).size).to eq 1
    end

    it "does not keep dealt cards in the deck" do
      cards = deck.deal!(5)
      cards.each do |card|
        expect(deck.cards.include?(card)).to_not be
      end
      expect(deck.cards.size).to eq 47
    end

    it "raises an empty deck error if asked for too many cards" do
      expect { deck.deal!(53) }.to raise_exception(Teller::Deck::EmptyDeck)
    end
  end
end