require 'pry'
class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending" 
  end 

  def valid?
  @sender.valid? && @receiver.valid? 
    #binding.pry 
  end 

  def execute_transaction

    #if @sender.balance < self.amount || @sender.status == "closed"
     # @status = "rejected"
      #"Transaction rejected. Please check your account balance."
    #end 
    if @status == "pending" && @sender.balance > self.amount && self.valid? 
      @sender.balance = @sender.balance - self.amount 
      @receiver.balance = @receiver.balance + self.amount
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  
  end 

  def reverse_transfer
    if @status == "complete"
    @sender.balance = @sender.balance + self.amount 
      @receiver.balance = @receiver.balance - self.amount

      @status = "reversed"
    end
  end 
  #binding.pry 


end

0