class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    # can initialize a Bank Account
    # initializes with a name
    # always initializes with balance of 1000
    # always initializes with a status of 'open'
    # can't change its name
    end

    def deposit(deposit_amount)
        self.balance += deposit_amount
        # can deposit money into its account    
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        #is valid with an open status and a balance greater than 0
        self.balance > 0 && self.status == 
        "open"
    end

    def close_account
        #can close account
        self.status = "closed"
    end

end
