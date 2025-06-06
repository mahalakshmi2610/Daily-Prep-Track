class BankAccount:
    def __init__(self, owner, balance=0):
        self.owner = owner
        self._balance = balance

    def deposit(self, amount):
        self._balance += amount

    def withdraw(self, amount):
        if amount <= self._balance:
            self._balance -= amount
        else:
            print("Insufficient funds")

    def display_balance(self):
        print(f"{self.owner}'s balance: {self._balance}")

class SavingsAccount(BankAccount):
    def __init__(self, owner, balance=0, interest_rate=0.03):
        super().__init__(owner, balance)
        self.interest_rate = interest_rate

    def apply_interest(self):
        interest = self._balance * self.interest_rate
        self.deposit(interest)
        print(f"Interest of {interest} added to {self.owner}'s account.")

class CurrentAccount(BankAccount):
    def __init__(self, owner, balance=0, overdraft_limit=500):
        super().__init__(owner, balance)
        self.overdraft_limit = overdraft_limit

    def withdraw(self, amount):
        if amount <= self._balance + self.overdraft_limit:
            self._balance -= amount
            print(f"{amount} withdrawn (Overdraft allowed)")
        else:
            print("Overdraft limit exceeded")

acc1 = SavingsAccount("Alice", 1000)
acc1.apply_interest()
acc1.display_balance()

acc2 = CurrentAccount("Bob", 300)
acc2.withdraw(700)  # Overdraft used
acc2.display_balance()