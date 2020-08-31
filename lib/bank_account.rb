class BankAccount
attr_accessor :value, :balance, :status
attr_reader :name 

def initialize(name)
    @name = name 
    @balance = 1000
    @status = "open"
end


def deposit(value)
    @balance = @balance + value 
end 

def display_balance
    "Your balance is $#{self.balance}."
end 

def valid?
if self.balance > 0 && self.status == "open"
    true
else
    false 
end 
end 

def close_account
    self.status = "closed"
end 

def withdrawal(value)
    @balance = @balance - value
end 
 
end 
