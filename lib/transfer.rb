require 'pry'
class Transfer

attr_reader :sender, :receiver, :amount
attr_accessor :status, :count

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
  @count = 0
end

def valid?
  @sender.valid? && @receiver.valid? && @sender.balance > @amount
end

def execute_transaction
  if valid? && @status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  else
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
 if @status == "complete"
   @receiver.balance -= @amount
   @sender.balance += @amount
   @status = "reversed"
 end
end

end
