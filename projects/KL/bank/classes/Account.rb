class Account
  attr_accessor :name, :balance, :ssn, :id

  def initialize(name, balance, ssn)
    @name = name
    @balance = balance
    @ssn = ssn
    @id = rand(1..100)
  end

  def withdrawl_balance(balance)
    valid = Utilities.validate_balance(balance)
    unless valid
      Prompt.show_invalid_message
      return
    end
    @balance -= balance
  end

  def add_balance(balance)
    valid = Utilities.validate_balance(balance)
    unless valid
      Prompt.show_invalid_message
      return
    end
    @balance += balance
  end

  def view_info
    puts "Id#: #{@id}, Name: #{@name}, Balance: #{@balance}, SSN: #{@ssn}"
  end
end
