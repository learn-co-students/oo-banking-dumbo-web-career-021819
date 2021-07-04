class Transfer
  attr_accessor :sender, :receiver,:amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
  @sender.valid? == true && @receiver.valid? == true ? true : false
  end

  def execute_transaction
    if !@sender.valid? || @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if self.status == "complete"
       return "not valid"
     else
      @receiver.deposit(@amount)
      @sender.balance -= @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
end
