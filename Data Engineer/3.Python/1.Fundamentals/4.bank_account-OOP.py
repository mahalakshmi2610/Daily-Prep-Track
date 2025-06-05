class BankAccount:
    def __init__(self, owner, balance=0):
        self.owner = owner
        self.balance = balance

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            print(f"Deposited: {amount}")
        else:
            print("Invalid deposit amount.")

    def withdraw(self, amount):
        if amount <= self.balance:
            self.balance -= amount
            print(f"Withdrawn: {amount}")
        else:
            print("Insufficient balance.")

    def display_balance(self):
        print(f"{self.owner}'s balance: {self.balance}")

class SavingsAccount(BankAccount):
    def __init__(self, owner, balance=0, interest_rate=0.03):
        super().__init__(owner, balance)
        self.interest_rate = interest_rate

    def apply_interest(self):
        interest = self.balance * self.interest_rate
        self.balance += interest
        print(f"Interest added: {interest}")

acc1 = SavingsAccount("Mahalakshmi Kumar", 500, 0.02)
# acc1 = SavingsAccount("Mahalakshmi Kumar", 500)
# acc1 = SavingsAccount("Mahalakshmi Kumar")
acc1.display_balance()
acc1.deposit(200)
acc1.withdraw(100)
acc1.display_balance()
acc1.apply_interest()
acc1.display_balance()