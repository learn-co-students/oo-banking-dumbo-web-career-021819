require 'pry'
class Transfer

  attr_reader :sender, :receiver, :status, :amount

  @@all_transfers = []

  def initialize(sender, receiver, amount = 50, transfer_status = 'pending')
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = transfer_status
  end


  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if @status == 'pending' && sender.valid? && sender.balance >= amount
      sender.balance -= self.amount
      receiver.balance += self.amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."

    end
    # binding.pry
  end

  def reverse_transfer
    # binding.pry
    execute_transaction
    sender.balance += self.amount
    receiver.balance -= self.amount
    @status = 'reversed'
  end

end
