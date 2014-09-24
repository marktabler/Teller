
RSpec.describe Teller::Hand do

  context "#parse" do
    context "given a valid hand code" do
      let(:hand_code) { "AHTS5D9CAD" }

      it "produces a new hand object" do
        expect(Teller::Hand.parse(hand_code)).to be_a(Teller::Hand)
      end

      it "contains 5 valid cards" do
        expect(Teller::Hand.parse(hand_code).cards.size).to eq 5
        expect(Teller::Hand.parse(hand_code).cards.map(&:class).uniq).to eq [Teller::Card]
      end
    end
  end

  context "#to_s" do
    let(:hand) { Teller::Hand.parse('AHTS5D9CAD') }

    it "translates a hand's cards back into a code string" do
      expect(hand.to_s).to eq ('AHTS5D9CAD')
    end
  end
end