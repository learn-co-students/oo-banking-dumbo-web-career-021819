class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction

    if self.valid? == false || @sender.balance < @amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    initial_balance = 1000
    if @sender.balance != initial_balance
      self.status
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    end




  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end
