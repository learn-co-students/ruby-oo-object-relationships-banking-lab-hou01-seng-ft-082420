require "pry"
require_relative "./bank_account.rb"

class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount 

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender 
    @receiver = receiver
    @status = status 
    @amount = amount 
  end

  def valid? 
    if sender.valid? == true && receiver.valid? == true 
      return true 
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && sender.balance > self.amount && self.status == "pending"
      sender.withdrawal(@amount)
      receiver.deposit(@amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.execute_transaction
      sender.deposit(@amount)
      receiver.withdrawal(@amount)
      self.status = "reversed"
    end 
  end


end
