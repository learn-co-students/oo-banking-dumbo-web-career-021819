require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :amount, :status, :receiver, :counter
 

  def initialize(sender,receiver,amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = 'pending'
  	@counter = 0
  end

  def valid?
  	if @sender.valid? && @receiver.valid?
  		true
  	else
  		false
  	end
  end

  def execute_transaction
   
    if valid? && @counter < 1 && sender.balance >= amount
    	@sender.balance -= amount
    	@receiver.balance += amount
    	@status = 'complete'
    	@counter = 2
    else
    	
    	@status = 'rejected'
    	"Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
  	if @status == 'complete'
  		@sender.balance += amount
    	@receiver.balance -= amount
    	@status = 'reversed'
end
end


end


