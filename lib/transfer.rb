class Transfer

  attr_accessor :amount, :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    #can check that both accounts are valid
    #calls on the sender and receiver's #valid? methods
    sender.valid? && receiver.valid?
  end

  def execute_transaction
  #can execute a successful transaction between two accounts
  # each transfer can only happen once
  # rejects a transfer if the sender does not have enough 
  # funds (does not have a valid account)

    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if valid? && sender.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

end
