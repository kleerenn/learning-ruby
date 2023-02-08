# Show messages to users

# frozen_string_literal: true

module Prompt
  def show_start_message
    puts 'Hello, Would you like to create an account? (Y/n)'
  end

  def new_account_info
    puts 'Enter your name: '
    name = gets.chomp.to_s

    puts 'Enter amount of money for initial deposit:'
    balance = gets.chomp.to_i

    puts 'Enter the SSN *NUMBERS ONLY* :'
    ssn = gets.chomp.to_i
    { name: name, balance: balance, ssn: ssn }
  end

  def show_invalid_message
    puts 'Invaid input!'
  end

  def show_menu_for_user
    puts "What do you want to do?:
        1. View balance
        2. Add balance
        3. Withdrawl money

        (Enter Q/q to exit)"
  end

  def enter_deposit
    puts 'Enter the amount money you want to deposit'
    gets.chomp.to_i
  end

  def show_remaining_balance(balance)
    puts "You have $#{balance} in your account!"
  end
end
