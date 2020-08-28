class BankAccount

    attr_accessor :value, :balance, :status, :withdrawl
    attr_reader :name

    def initialize (name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(value)
        @balance = @balance + value
    end

    def withdrawl(value)
        self.balance = @balance - (value)
    end

    def status
        @status
    end


    def display_balance
        return "Your balance is $#{self.balance}."
    end

    def valid?
        (self.balance > 0) && (self.status == "open")

    #does the same ^
        # if self.balance > 0 && self.status == "open"
        #     true
        # else
        #     false
        # end
    end

    def close_account
        self.status = "closed"
    end



end