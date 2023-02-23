# frozen_string_literal: true

require_relative '../modules/utilities'
require_relative '../modules/prompt'

# Bank account management class
class Account
  include Utilities
  include Prompt

  attr_accessor :name, :balance, :ssn, :id

  def initialize(name, balance, ssn)
    @name = name
    @balance = balance.to_f
    @ssn = ssn
    @id = rand(1..100)
  end

  def add_balance(balance)
    valid = validate_balance(balance)
    unless valid
      show_invalid_message
      return
    end
    @balance += balance
  end

  def withdrawl_balance(balance)
    valid = validate_balance(balance)
    unless valid
      show_invalid_message
      return
    end
    @balance -= balance
  end

  def view_info
    puts "Id#: #{@id}, Name: #{@name}, Balance: #{@balance}, SSN: #{@ssn}"
  end

  def add_interest(percentage)
    @balance += @balance * percentage
  end
end
