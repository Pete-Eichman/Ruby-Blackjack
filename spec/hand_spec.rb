require "spec_helper"
describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'
  #let(:card) { Card.new("10♦", "3♦")}
  let(:hand) { Hand.new }
  let(:deck) {Deck.new}
  describe Hand.new do
    it "should create an empty array" do
      hand1 = Hand.new
      expect(hand1.hand.empty?).to eq true
    end
  end

  describe "#calculate_hand" do
    it "should calculate the value of all the cards in the hand" do
      hand2 = Hand.new
      expect(hand2.calculate_hand).to eq(0)
    end
  end

  describe "#fix_aces" do
    it "should change the value of aces from 11 to 1, should the hand value go over 21" do
      hand3 = Hand.new
      expect(hand3.fix_aces(22, 2)).to eq(12)
    end
  end
end
