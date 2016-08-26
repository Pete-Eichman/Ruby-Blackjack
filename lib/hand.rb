require_relative 'deck'
require_relative 'card'
class Hand
  attr_reader :hand
  def initialize
    @hand = []
    @calculate_hand
  end

  def calculate_hand
    value = 0
    aces = 0
    @hand.each do |card|
      if ["J", "Q", "K"].include?(card.rank)
        value +=10
      elsif card.rank == "A"
        value += 11
        aces += 1
      else
        value += card.rank.to_i
      end
    end
    fix_aces(value, aces)
  end

  def fix_aces(sum, aces)
    while sum > 21 && aces > 0
      aces -= 1
      sum -= 10
      if sum < 21
        break
      end
    end
    sum
  end

  def add_to_hand(card)
    @hand << card
    @hand.flatten!
  end
end
