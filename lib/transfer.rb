require "pry"
class Transfer

  attr_accessor :name, :sender, :amount, :receiver, :friend, :status, :valid

  def initialize(sender,receiver,amount)
    @sender = sender
    @amount = amount
    @status = "pending"
    @receiver = receiver
  
  end

  def valid?
    if sender.status && receiver.status == "open"
      true
    else
      false
    end
      
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.balance > amount && self.status == "pending" && self.valid?
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.status = "reversed"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
    end
  end
end
# binding.pry
# 0