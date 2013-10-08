def calculate_total(cards)
#[['H', '3'], ['S','Q'],...]

arr = cards.map {|e| e[1]}

total = 0
arr.each do |value|
	if value == "Ace"
		total += 11
	elsif value.to_i == 0 #J,Q,K
		total += 10
	else 
		total += value.to_i
	end
end
# correct for Aces
arr.select{|e| e == "Ace"}.count.times do
	total -= 10 if total > 21
end

#if arr.include?("Ace") && total > 21
	total -= 10
#end

total
end

#Start Game

puts 'Welcome to the table'
puts 'whats your name?'
#player1 = gets.chomp
#puts 'Welcome ' + player1 + '!'
puts 'lets play blackjack!'

suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

#deck = []
#suits.each do |suit|
#	cards.each do |card|
#		deck << [suit, card]
#puts deck
deck = suits.product(cards)
deck.shuffle!

# Deal cards

mycards     = []
dealercards = []

mycards     << deck.pop
dealercards << deck.pop
mycards     << deck.pop
dealercards << deck.pop

#puts 'player your cards are' + mycards.to_s
#puts 'dealer your cards are' + dealercards.to_s

dealertotal = calculate_total(dealercards)
mytotal     = calculate_total(mycards)

#Show cards
puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts "you have: #{mycards [0]} and #{mycards [1]}, for a total of #{mytotal}"
puts ""

# Player Turn
if mytotal == 21
  puts "congratulations, you win!"
  exit
end
while mytotal < 21
  puts "What would you like to do? 1) hit 2) stay"
  hit_or_stay = gets.chomp
  if !['1', '2'].include?(hit_or_stay)
  	puts "Errror: you must enter 1 or 2"
  	next

  if hit_or_stay == "2"
  	put "you chose to stay."
  	break
  end	
end

#Hit
	new_card = deck.pop
	puts "Dealing card to player: #{new_card}"
	mycards << new_card
	mytotal = calculate_total(mycards)
	puts "your total: #{mytotal}"

	if mytotal == 21
		puts "congratulations, you win!"
		exit
	elseif mytotal > 21
		puts "Bust!"
		exit
	end
end

#Dealer Turn
if dealertotal == 21
	puts "Dealer Wins"
	exit
end

while dealertotal < 17
	#hit
	new_card = deck.pop
	puts "Dealing new card for dealer: #{new_card}"
	dealercards << new_card
	dealertotal = calculate_total(dealercards)
	puts "Dealer total is now: #{dealertotal}"
	if dealertotal == 21
		puts "Dealer Blackjack Wins!"
	elsif dealertotal > 21
		puts "You Win Dealer Busts"
		exit
	end
end

#Compare hands

puts "Dealer's cards: "
dealercards.each do |card|
	puts "=> #{card}"
end

puts "Your cards:"
mycards.each do |card|
	puts "=> #{card}"
end

puts ""

if dealertotal > mytotal
	puts "sorry Dealer won"
elsif dealertotal < mytotal
	puts "You Win!"
else
	puts "Its a Draw"
end

exit
















