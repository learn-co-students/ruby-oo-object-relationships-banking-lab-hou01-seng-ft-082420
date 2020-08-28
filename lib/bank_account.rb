class BankAccount

    attr_accessor :status, :balance, :withdrawl
    attr_reader :name
    
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(deposit)
        self.balance += deposit
    end

    def withdrawl(withdrawl)
        self.balance -= withdrawl
    end

    def display_balance
        p "Your balance is $#{self.balance}."
    end

    def valid?
        (self.status == "open") && (self.balance > 0)
    end

    def close_account
        self.status = "closed"
    end
end
