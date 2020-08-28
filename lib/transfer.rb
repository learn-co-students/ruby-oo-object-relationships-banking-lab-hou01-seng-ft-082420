require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :backup_amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @backup_amount = amount
    @status = 'pending'
  end 

  def valid? 
    if @sender.valid? && @receiver.valid?
      true 
    else 
      false
    end 
  end 

  def execute_transaction
    if valid? && self.sender.balance > self.amount
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount)
      self.status = 'complete'
      self.amount = 0
    else 
      self.status = 'rejected'
      p "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if self.status == 'complete'
      self.amount = self.backup_amount
      self.receiver.withdraw(self.amount)
      self.sender.deposit(self.amount)
      self.status = 'reversed'
    else 
      p "Transfer hasn't been executed"
    end 
  end
  
end
