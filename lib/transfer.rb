
class Transfer
    attr_accessor :bank_acount, :sender, :receiver, :status, :amount
    def initialize(sender,receiver,amount)
      @bank_acount = bank_acount
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end

    def valid?
      #if sender.status == "open" && receiver.status == "open"
      #  true
      #else
      #  false
      #end
      sender.valid? && receiver.valid?
    end

    def execute_transaction
      if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end

    end

    def reverse_transfer
      if execute_transaction
        sender.balance += amount
        receiver.balance -= amount
        self.status = "reversed"
      else
        reject_transfer
      end
    end

end