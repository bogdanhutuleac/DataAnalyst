class Chip():
    
    def __init__(self, bank):
        self.bank = bank

    def win(self, bet):
        self.bank += bet

    def lose(self, bet):
        self.bank -= bet

    def __str__(self) :
        return str(self.bank) + "$"
        