from InitialNeed import suits,ranks
import random
from CardModule import Card

class Deck():
    
    #no user input, all decks are the same
    def __init__(self):
        self.all_cards = []
        
        for suit in suits:
            for rank in ranks:
                #for every suit in suits will take the rank in ranks and create a deck
                
                #create the Card Object
                created_card = Card(suit,rank)
                
                #add the created card to the deck
                self.all_cards.append(created_card)
    
    def shuffle(self):
            random.shuffle(self.all_cards)
    
    def deal_one(self):
        #will remove and return the removed card
        return self.all_cards.pop()
    
# new_deck = Deck()

# for card in new_deck.all_cards:
#      print(card)

# if __name__ != "__main__":
#      new_deck = Deck()