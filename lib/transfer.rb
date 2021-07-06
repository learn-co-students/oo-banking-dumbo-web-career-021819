require_relative 'bank_account'

class Transfer

  attr_reader :sender, :receiver

  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? && @amount <= sender.balance
  end

  def execute_transaction
    if self.status == 'pending' && valid?
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
