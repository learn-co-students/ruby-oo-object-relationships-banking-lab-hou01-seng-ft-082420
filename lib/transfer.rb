class Transfer

  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    (self.sender.valid?) && (self.receiver.valid?)
  #   if self.sender.valid? && self.receiver.valid?
  #     true
  #   else
  #     false
  #   end
  end

  def execute_transaction
    if self.sender.balance > @amount && self.valid? == true && self.status == "pending"
      #requires these 3 to allow txn
      self.receiver.deposit(@amount)
      self.sender.withdrawl(@amount)
      @status = "complete"
    else
      @status = "rejected"
      p "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
    self.receiver.withdrawl(@amount)
    self.sender.deposit(@amount)
    @status = "reversed"
    end
  end

end
