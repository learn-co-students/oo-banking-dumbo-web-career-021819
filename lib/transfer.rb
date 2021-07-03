class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def valid?

    sender.valid? && receiver.valid? && sender.balance >= @amount
  end

  def execute_transaction
    if @status == "complete" || !valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

      end
      receiver.deposit(amount)
      sender.withdraw(amount)
      @status = "complete"

  end

  def reverse_transfer
    if @status != "complete"
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

      end
      receiver.withdraw(amount)
      sender.deposit(amount)
      @status = "reversed"
  end



end
