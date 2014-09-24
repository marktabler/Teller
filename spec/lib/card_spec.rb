
RSpec.describe Teller::Card do

  context "#parse" do
    context "given a valid code" do
      let(:ace_code) { "AH" }
      let(:deuce_code) { "2S" }

      it "produces a new card object" do
        expect(Teller::Card.parse(ace_code)).to be_a(Teller::Card)
      end

      it "correctly identifies value" do
        expect(Teller::Card.parse(ace_code).value).to eq 14
        expect(Teller::Card.parse(deuce_code).value).to eq 2
      end

      it "correctly identifies suit" do
        expect(Teller::Card.parse(ace_code).suit).to eq 3
        expect(Teller::Card.parse(deuce_code).suit).to eq 4
      end

    end
    
    context "given an invalid code" do
      let(:bad_value) { "FH" }
      let(:bad_suit) { "7R" }
      it "raises an UnknownCard error for invalid values" do
        expect { Teller::Card.parse(bad_value) }.to raise_exception(Teller::Card::UnknownCard)
      end

      it "raises an UnknownCard error for invalid suits" do
        expect { Teller::Card.parse(bad_suit) }.to raise_exception(Teller::Card::UnknownCard)
      end
    end
  end

end