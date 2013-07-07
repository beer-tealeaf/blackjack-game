def calculate_total(cards)
  arr = cards.map{|e| e[1]}

  total = 0
  arr.each {|value|
    if value.to_i == 0
      total = total + 10
    else
      total += value.to_i
    end
  }
   
  arr.select{|e| e=="A"}.count.times do
    total -= 10 if total>21
  end 
  

  total
end



puts 'welcome to blackjack'
suits = ['H','D','S','C']
cards = ['2','3','4','5','6','7','8','9','J','Q','k','A']

deck = suits.product(cards)
deck.shuffle!

mycards = []
dealercards = []
mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

puts "my cards  are #{mycards.at(0)} and #{mycards.at(1)} for a total of #{mytotal}"
puts "dealer cards  are #{dealercards.at(0)} and #{dealercards.at(1)} for a total of #{dealertotal}"


if mytotal == 21
  puts 'congrats , u hit blackjack! u win!'
  exit
end


while mytotal < 21
  puts 'would u like to to do ? hit(1 or stay (2 ?'
  hit_or_stay = gets.chomp

  if !['1','2'].include?(hit_or_stay)
    puts 'error: u must enter 1 or 2'
    next
  end

  if hit_or_stay == "2"
    puts 'u chose to stay.'
    break
  end
 
  new_card = deck.pop
  puts "dealing card to player: #{new_card}"
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "your total is now: #{mytotal}"

  if mytotal == 21
    puts 'congrats u hit blackjack , u win!'
    exit
  elsif mytotal >21
    puts 'sorry , u seems busted'
    exit
  end


end

if dealertotal ==21
   puts 'sorry , dealer hit blackjack. u lose!'
   exit
end

while dealertotal < 17

  new_card = deck.pop
  puts "dealing new card for dealer: #{new_card}"
  
  dealercards << new_card
  dealertotal = calculate_total(dealercards)
  puts "dealer total is now : #{dealertotal}"

  if dealertotal == 21
    puts 'sorry , dealer hit blackjack. u lose.'
    exit
  elsif dealertotal >21
     puts 'contgrats, dealer busted! u win'
     exit
  end


end

puts "dealer's cards:"
  dealercards.each{ |c|
 puts "=> #{c}"
}

puts "ur cards:"
  mycards.each{|c|
  puts "=> #{c}"

}

if dealertotal > mytotal
   puts "sorry , dealer won!"
   exit
elsif dealertotal< mytotal
  puts "congeats, u win!"
else 
  puts "it's a tie!"  
end



