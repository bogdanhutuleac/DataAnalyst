

class Player ():
    
    def __init__(self,name) :
        self.name = name
        self.all_card = []

    def hit(self, card):

        self.all_card.append(card)

    def ace_value(self):
        for card in self.all_card:
          if (card.rank == "Ace"):
            while True:
              try:
                  ace_value = int(input("Ace value will be?(1/11)"))
              except:
                  print("That is not a valid number!")
              else:
                  if (ace_value == 1):
                      card.value = 1
                      break
                  elif(ace_value == 11):
                      card.value = 11
                      break
                  else:
                      print("It needs to be 1 or 11!")
            
    
    def stay(self):
        total = 0
        for card in self.all_card:
            total += card.value
        return total
    def bust(self):
        if(self.stay()) > 21:
            return True
        else:
            return False

