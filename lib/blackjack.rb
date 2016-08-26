require_relative "deck"
require_relative "hand"
require_relative "card"

deck = Deck.new
player = Hand.new
dealer = Hand.new

puts "Welcome to Blackjack!\n
"

player.add_to_hand(deck.deal(2))

puts "Player was dealt #{player.hand[0].rank} #{player.hand[0].suit}"
puts "Player was dealt #{player.hand[1].rank} #{player.hand[1].suit}"
puts "Player score is: #{player.calculate_hand}"
puts "Hit or Stay? (please type h for hit, s for stay)\n
"
input = gets.chomp

while player.calculate_hand < 22
  if input == "h"
    puts "Player hits."
    player.add_to_hand(deck.deal(1))
    puts "Player was dealt #{player.hand[-1].rank} #{player.hand[-1].suit}"
    puts "Player score is: #{player.calculate_hand}"
    if player.calculate_hand > 21
      puts "Player busts! You lose."
      break
    end
    puts "Hit or Stay? (please type h for hit, s for stay)"
    input = gets.chomp
  elsif input == "s"
    puts "Player stays."
    break
  else
    puts "Please type h for hit, s for stay"
    input = gets.chomp
  end
end

if player.calculate_hand <= 21
  dealer.add_to_hand(deck.deal(2))
  puts "Dealer was dealt #{dealer.hand[0].rank} #{dealer.hand[0].suit}"
  puts "Dealer was dealt #{dealer.hand[1].rank} #{dealer.hand[1].suit}"
  if dealer.calculate_hand > 18 && dealer.calculate_hand < player.calculate_hand
    puts "Player score is: #{player.calculate_hand}"
    puts "Player wins!"
  else
    while dealer.calculate_hand < 17
    dealer.add_to_hand(deck.deal(1))
    puts "Dealer was dealt #{dealer.hand[-1].rank} #{dealer.hand[-1].suit}"
      if dealer.calculate_hand >= 17 && dealer.calculate_hand < player.calculate_hand
        puts "Dealer score is: #{dealer.calculate_hand}"
        puts "Player score is: #{player.calculate_hand}"
        puts "Player wins!"
      end
    end
  end

  if dealer.calculate_hand > 21
    puts "Dealer score is: #{dealer.calculate_hand}"
    puts "Dealer Busts! You win!"
  elsif dealer.calculate_hand <=21 && dealer.calculate_hand >= player.calculate_hand
    puts "Dealer score is: #{dealer.calculate_hand}"
    puts "Dealer Wins! You lose."
  end
end
