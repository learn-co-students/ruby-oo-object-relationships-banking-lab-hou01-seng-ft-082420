class Transfer
  require 'pry'
  attr_accessor :transfer, :sender, :receiver, :status, :amount 
  # your code here
  def initialize(sender, receiver, amount)
    @transfer = transfer
    @sender = sender 
    @receiver =  receiver
    @status = "pending"
    @amount = amount 
    @backup_amount = amount 
  end 

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else 
      false 
    end 
  end 

  def execute_transaction
   if self.valid? == true && self.sender.balance > @amount 
    self.receiver.deposit(@amount)
    self.sender.withdrawal(@amount)
    @status = "complete"
    @amount = 0 
   else 
    
      #self.sender.balance < @amount 
      #binding.pry
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
   end 
  end 

  def reverse_transfer
    if self.status == "complete"
    self.receiver.withdrawal(@backup_amount)
    self.sender.deposit(@backup_amount)
    @status = "reversed"
    end 
  end 
end
