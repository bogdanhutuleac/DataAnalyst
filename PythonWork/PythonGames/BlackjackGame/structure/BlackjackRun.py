
# from InitialNeed import suits,ranks,values
from CardModule import Card
from DeckModule import Deck
from playerModule import Player
from ChipModule import Chip



game_on = True
bank_chip = Chip(150)
while game_on:
    
    # initializing
    new_deck = Deck()
    new_deck.shuffle()

    player_one = Player("One")
    dealer = Player("Dealer")
    # round start
    for n in range(2):
        player_one.hit(new_deck.deal_one())
        dealer.hit(new_deck.deal_one())
    
    # ask for bet
    while True:
        try:
            bet = int(input("Place you're bet: "))
        except:
            print("That is not a valid number!")
        else:
            if(bet > bank_chip.bank):
                print(f"Not enough money! You acc: {bank_chip}")
                continue
            break
 
    # Display cards
    print(f"Player cards are: {player_one.all_card[0]}, {player_one.all_card[1]} at the value of {player_one.stay()}")
    print(f"Dealears cards are: {dealer.all_card[0]}, hidden ")
        
    # player turn
    get_card = True
    dealer_turn = True
    player_one.ace_value()
    while get_card:
        if(player_one.stay() == 21):
            cards_player_value = player_one.stay()
            cards_dealer_value = dealer.stay()
            dealer_turn = False
            bet = bet*1.5
            break
        response = input("Hit or Stay?(H/S)")

        if response.lower() == "h":
             player_one.hit(new_deck.deal_one())
             print(f"{player_one.all_card[-1]}")
            #  if it's ace ask for value
             if(player_one.all_card[-1].rank == "Ace"):
                player_one.ace_value()

             if player_one.bust():
                cards_player_value = player_one.stay()
                cards_dealer_value = dealer.stay()
                dealer_turn = False
                 
                #  bank_chip.lose(bet)
                #  print(f"You lose, {player_one.stay()}")
                #  print()
                #  game_on = False
                break
        elif response.lower() == "s":
            cards_player_value = player_one.stay()
            # game_on = False
            break

    #dealers turn
    # print(f"Dealer turn:{dealer_turn}")
    while dealer_turn:
        # 
        if dealer.stay() <= 16:
            dealer.hit(new_deck.deal_one())
        else:
            print("Dealers cards: ")
            for cards in dealer.all_card:
                print(cards)
            cards_dealer_value = dealer.stay()
            break
    
    #if bust 
    if(player_one.bust()):
        bank_chip.lose(bet)
        print(f"You busted! Dealer:{cards_dealer_value}, player:{cards_player_value} ")
    elif(dealer.bust()):
        bank_chip.win(bet)
        print(f"Dealer busted! Dealer:{cards_dealer_value}, player:{cards_player_value} ")
        
    # if any won
    elif(cards_dealer_value >= cards_player_value):
        bank_chip.lose(bet)
        print(f"You loose! Dealer:{cards_dealer_value}, player:{cards_player_value} ")
            
    elif(cards_dealer_value < cards_player_value):
        bank_chip.win(bet)
        print(f"You win! Dealer:{cards_dealer_value}, player:{cards_player_value} ")

    while True: 

        if(bank_chip.bank <= 0):
            game_on = False
            print(f"Not enough money! Your bank is: {bank_chip}")
            break

        still_play = input("Do you wanna keep playing? (Y/N)")

        if still_play.lower() == "y":
            break
        elif still_play.lower() == "n":
            game_on = False
            print(f"Your bank is: {bank_chip}")
            break
        


