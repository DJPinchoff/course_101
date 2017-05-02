require 'pry'
GAME_TITLE = 'TWENTY-ONE' # Change to WHATEVER-ONE
BUSTED = 21 # Match this integer to GAME_TITLE string
DEALER_STAYS = BUSTED - 4
PLAYER = 'Player'
DEALER = 'Dealer'
INITIAL_DEAL = " "
WELCOME = "    WELCOME TO #{GAME_TITLE}!"
ROUNDS = 5 # Number of Rounds to win the match
GOAL = "Win #{ROUNDS} Rounds Before the Dealer"
PLAYER_WIN = "CONGRATULATIONS!! You win."
DEALER_WIN = "BETTER LUCK NEXT TIME!! Dealer wins."
DEALER_BUSTED = "DEALER BUSTED! You win."
PLAYER_BUSTED = "YOU BUSTED! Dealer wins."
TIE = "IT'S A TIE!! Nothing ventured, nothing gained."
DECK = { 1 => { value: 1, value_name: "Ace",
                suit: "Clubs", present: true },
         2 => { value: 2, value_name: "Two",
                suit: "Clubs", present: true },
         3 => { value: 3, value_name: "Three",
                suit: "Clubs", present: true },
         4 => { value: 4, value_name: "Four",
                suit: "Clubs", present: true },
         5 => { value: 5, value_name: "Five",
                suit: "Clubs", present: true },
         6 => { value: 6, value_name: "Six",
                suit: "Clubs", present: true },
         7 => { value: 7, value_name: "Seven",
                suit: "Clubs", present: true },
         8 => { value: 8, value_name: "Eight",
                suit: "Clubs", present: true },
         9 => { value: 9, value_name: "Nine",
                suit: "Clubs", present: true },
         10 => { value: 10, value_name: "Ten",
                 suit: "Clubs", present: true },
         11 => { value: 10, value_name: "Jack",
                 suit: "Clubs", present: true },
         12 => { value: 10, value_name: "Queen",
                 suit: "Clubs", present: true },
         13 => { value: 10, value_name: "King",
                 suit: "Clubs", present: true },
         14 => { value: 1, value_name: "Ace",
                 suit: "Diamonds", present: true },
         15 => { value: 2, value_name: "Two",
                 suit: "Diamonds", present: true },
         16 => { value: 3, value_name: "Three",
                 suit: "Diamonds", present: true },
         17 => { value: 4, value_name: "Four",
                 suit: "Diamonds", present: true },
         18 => { value: 5, value_name: "Five",
                 suit: "Diamonds", present: true },
         19 => { value: 6, value_name: "Six",
                 suit: "Diamonds", present: true },
         20 => { value: 7, value_name: "Seven",
                 suit: "Diamonds", present: true },
         21 => { value: 8, value_name: "Eight",
                 suit: "Diamonds", present: true },
         22 => { value: 9, value_name: "Nine",
                 suit: "Diamonds", present: true },
         23 => { value: 10, value_name: "Ten",
                 suit: "Diamonds", present: true },
         24 => { value: 10, value_name: "Jack",
                 suit: "Diamonds", present: true },
         25 => { value: 10, value_name: "Queen",
                 suit: "Diamonds", present: true },
         26 => { value: 10, value_name: "King",
                 suit: "Diamonds", present: true },
         27 => { value: 1, value_name: "Ace",
                 suit: "Spades", present: true },
         28 => { value: 2, value_name: "Two",
                 suit: "Spades", present: true },
         29 => { value: 3, value_name: "Three",
                 suit: "Spades", present: true },
         30 => { value: 4, value_name: "Four",
                 suit: "Spades", present: true },
         31 => { value: 5, value_name: "Five",
                 suit: "Spades", present: true },
         32 => { value: 6, value_name: "Six",
                 suit: "Spades", present: true },
         33 => { value: 7, value_name: "Seven",
                 suit: "Spades", present: true },
         34 => { value: 8, value_name: "Eight",
                 suit: "Spades", present: true },
         35 => { value: 9, value_name: "Nine",
                 suit: "Spades", present: true },
         36 => { value: 10, value_name: "Ten",
                 suit: "Spades", present: true },
         37 => { value: 10, value_name: "Jack",
                 suit: "Spades", present: true },
         38 => { value: 10, value_name: "Queen",
                 suit: "Spades", present: true },
         39 => { value: 10, value_name: "King",
                 suit: "Spades", present: true },
         40 => { value: 1, value_name: "Ace",
                 suit: "Hearts", present: true },
         41 => { value: 2, value_name: "Two",
                 suit: "Hearts", present: true },
         42 => { value: 3, value_name: "Three",
                 suit: "Hearts", present: true },
         43 => { value: 4, value_name: "Four",
                 suit: "Hearts", present: true },
         44 => { value: 5, value_name: "Five",
                 suit: "Hearts", present: true },
         45 => { value: 6, value_name: "Six",
                 suit: "Hearts", present: true },
         46 => { value: 7, value_name: "Seven",
                 suit: "Hearts", present: true },
         47 => { value: 8, value_name: "Eight",
                 suit: "Hearts", present: true },
         48 => { value: 9, value_name: "Nine",
                 suit: "Hearts", present: true },
         49 => { value: 10, value_name: "Ten",
                 suit: "Hearts", present: true },
         50 => { value: 10, value_name: "Jack",
                 suit: "Hearts", present: true },
         51 => { value: 10, value_name: "Queen",
                 suit: "Hearts", present: true },
         52 => { value: 10, value_name: "King",
                 suit: "Hearts", present: true } }

def clear_screen
  system('clear') || system('cls')
end

def joinor(array, delimiter, word)
  if array.size == 1
    array[0].to_s
  elsif array.size == 2
    array.join(" #{word} ")
  else
    array[-1] = "#{word} #{array[-1]}"
    array.join("#{delimiter} ")
  end
end

def pick_card(deck)
  card_num = nil
  loop do
    card_num = rand(1..52)
    break if deck[card_num][:present] == true
  end
  card = deck[card_num]
  deck[card_num][:present] = false # Take card out of deck
  card
end

def card_name(card)
  value = card[:value]
  value = 'A' if value == 1

  "#{card[:value_name]} of #{card[:suit]} (#{value})"
end

def display_card_names(card_array, token)
  puts "#{token} Cards: "
  card_name_array = card_array.map { |card| card_name(card) }
  puts joinor(card_name_array, ",", "and")
end

def deal!(person_cards, deck)
  person_cards << pick_card(deck)
end

def display_dealer_showing(dealer_cards) # Show dealer's 2nd card received
  puts "Dealer Showing:"
  puts card_name(dealer_cards[1])
end

def player_choice
  choice = ""
  loop do
    puts "Hit or Stay? (H or S)"
    print ">>> "
    choice = gets.chomp.downcase
    break if choice == 'h' || choice == 's'
    puts "I'm sorry. I didn't understand..."
    puts
  end

  choice
end

def hand_total(card_array)
  sum = 0
  num_of_aces = 0
  card_array.each do |card|
    card[:value] != 1 ? sum += card[:value] : num_of_aces += 1
  end
  return sum if num_of_aces == 0 # No aces in hand

  sum += num_of_aces # Account for aces - only one Ace could be 11 at a time
  sum += 10 if sum + 10 <= 21
  sum
end

def display_hand_total(card_array)
  puts "Total: #{hand_total(card_array)}"
end

def busted?(card_array)
  hand_total(card_array) > BUSTED
end

def display_dealing_delay_effect
  print "Dealing another card."
  3.times do
    sleep(0.75)
    print "."
  end
  puts
end

def display_updated_screen(_deck, dealer_cards, player_cards, turn)
  clear_screen
  puts WELCOME
  puts GOAL
  # Include next 2 lines and deck parameter to help with card counting in game:
  # cards_left = deck.values.count { |card| card[:present] == true }
  # puts "#{cards_left} Cards Left In Deck"
  puts

  display_dealer_showing(dealer_cards) if turn == PLAYER
  display_card_names(dealer_cards, DEALER) if turn == DEALER
  display_hand_total(dealer_cards) if turn == DEALER
  puts if turn == DEALER || turn == PLAYER

  display_card_names(player_cards, PLAYER)
  display_hand_total(player_cards)
  puts
end

def winning_message(dealer_cards, player_cards)
  p_total = hand_total(player_cards)
  d_total = hand_total(dealer_cards)
  if p_total > d_total
    PLAYER_WIN
  elsif p_total < d_total
    DEALER_WIN
  else
    TIE
  end
end

def display_scores(dealer, player)
  puts "Player Wins: #{player}"
  puts "Dealer Wins: #{dealer}"
end

def match_win?(dealer, player)
  dealer == ROUNDS || player == ROUNDS
end

def display_match_win(dealer, player)
  if player > dealer
    puts "YOU WON 5 TIMES BEFORE THE DEALER! It's time to reshuffle..."
  else
    puts "DEALER WON 5 TIMES BEFORE YOU! It's time to reshuffle..."
  end
end

def play_again
  choice = ""
  loop do
    puts
    puts "Play again?!? (Y or N)"
    print ">>> "
    choice = gets.chomp.downcase
    break if choice == 'y' || choice == 'n'
    puts "I'm sorry! I didn't understand..."
    puts
  end
  choice
end

deck = DECK
player_wins = 0
dealer_wins = 0

loop do # main loop
  deck.values.each { |card| card[:present] = true }

  player_cards = []
  dealer_cards = []

  2.times do
    deal!(player_cards, deck)
    deal!(dealer_cards, deck)
    display_updated_screen(deck, dealer_cards, player_cards, INITIAL_DEAL)
    display_dealing_delay_effect
  end

  loop do # Player's turn
    display_updated_screen(deck, dealer_cards, player_cards, PLAYER)
    choice = player_choice
    break if choice == 's' # stay

    deal!(player_cards, deck) # hit
    break if busted?(player_cards) # bust
  end

  if busted?(player_cards)
    display_updated_screen(deck, dealer_cards, player_cards, PLAYER)
    puts PLAYER_BUSTED
    dealer_wins += 1
  else
    loop do # Dealer's turn
      display_updated_screen(deck, dealer_cards, player_cards, DEALER)
      break if hand_total(dealer_cards) >= DEALER_STAYS # stay without thinking

      display_dealing_delay_effect
      deal!(dealer_cards, deck) # hit
      break if busted?(dealer_cards) # bust
    end

    # Dealer has now stayed or busted:
    display_updated_screen(deck, dealer_cards, player_cards, DEALER)
    if busted?(dealer_cards)
      puts DEALER_BUSTED
      player_wins += 1
    else # Dealer and Player stayed <= 21, so who won?
      winner = winning_message(dealer_cards, player_cards)
      puts winner
      player_wins += 1 if winner == PLAYER_WIN
      dealer_wins += 1 if winner == DEALER_WIN
    end
  end

  display_scores(dealer_wins, player_wins)
  if match_win?(dealer_wins, player_wins)
    display_match_win(dealer_wins, player_wins)
  end

  choice = play_again

  if choice == 'n'
    puts "Thank you for playing #{GAME_TITLE}!!"
    puts "Goodbye!"
    break

  elsif player_wins == ROUNDS || dealer_wins == ROUNDS
    player_wins = 0
    dealer_wins = 0
  end
end
