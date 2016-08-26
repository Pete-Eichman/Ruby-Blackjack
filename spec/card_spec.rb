require "spec_helper"
# require_relative "../../card"

  describe Card do
    let(:card) { Card.new(10, "♥") }
      it "checks if card has a rank and suit" do
        expect(card.rank).to_not eq nil
        expect(card.suit).to_not eq nil
      end
    end
