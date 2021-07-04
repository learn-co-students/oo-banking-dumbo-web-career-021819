class BankAccount

    attr_accessor  :balance, :status #setter/getter
    attr_reader :name #getter

    def initialize(name)
      @name = name #instance variable
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
      @status == "open" && @balance > 0 ? true : false
    end

    def close_account
      @status = "closed"
    end
end
