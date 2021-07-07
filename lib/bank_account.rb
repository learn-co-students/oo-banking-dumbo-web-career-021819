  class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize (name)
      @name = name
      @balance = 1000
      @status = "open"
    end

    def deposit(money)
      @balance += money
    end

    def display_balance
      "Your balance is $#{@balance}."
    end

    def valid?
      if @status == "open" && @balance > 0
        return true
        # if status is open which it is from beginning and balance 0 return T end method
      end
      false     #return false
    end

    def close_account
      @status = "closed"
    end






  end
