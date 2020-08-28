require 'pry'
class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    @@all = []
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"

        self.class.all << self
        
    end

    def deposit(deposit)
        if @name = name
        @balance += deposit
        #self.balance += 1000 
        end
        
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if self.status == "open" && self.balance > 0
            return true
        else
            return false
        end   
    end

    def close_account
        self.status = "closed"
    end

    def self.all
        @@all
    end
    #def transfer(name,friend,amount)




end

#binding.pry
#0