from InitialNeed import values

class Card():
    
    def __init__(self,suit,rank):
        self.suit = suit
        self.rank = rank
        #value will be set to values at key of rank from dic values
        self.value = values[rank]
        
    def __str__(self):
        return self.rank + " of " + self.suit

# two_heart = Card("Hearts","Two")
# print(two_heart)
# print(two_heart.value)