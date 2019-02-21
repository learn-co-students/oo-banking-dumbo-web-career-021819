require 'pry'

class Transfer

  attr_reader :sender, :receiver

  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? && @amount <= sender.balance
  end

  def execute_transaction
    if @status == "pending"
      if valid?
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      else
        @status = 'rejected'
        return "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
