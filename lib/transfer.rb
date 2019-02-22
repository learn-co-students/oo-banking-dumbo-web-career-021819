class Transfer
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
    #Trying to call the other valid method and recieve either true or false
  end
  
  def execute_transaction
    #check valid, valid pass, sender balance - amount ,amount + reciever balance if false then reject transfer
    if @status == "pending"
  
      if valid? == true
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
  
  
  
end
