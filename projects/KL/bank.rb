=begin
User can add relatives to the bank account (Have their own separate account, but tied to the main account)
User can type their last name and last 4 digits of their social security access their account
User can withdrawal money from account
User can add money to the account
User can view their balance
User can transfer money to other relatives
Primary user can ONLY see who has the most and least money
Primary user can delete relatives from the account
=end

module Utilities
    def validate_balance(balance)
        valid = true
        if balance < 0 
            puts "it's less than 0 or string!!!!!"
            valid = false
        end
        return valid
    end

    def validate_ssn(ssn)
        # TODO: reg pattern
        valid = true
        digits = Math.log10(ssn).to_i + 1
        if digits != 10
            valid = false
        end
        return valid
    end

end

module Prompt
    def show_start_message
        puts "Hello, Would you like to create an account? (Y/n)"
    end

    def get_new_account_info
        puts "Enter your name: "
        name = gets.chomp.to_s

        puts "Enter amount of money for initial deposit:"
        balance = gets.chomp.to_i

        puts "Enter the SSN *NUMBERS ONLY* :"
        ssn = gets.chomp.to_i
        return { name: name, balance: balance, ssn: ssn }
    end

    def show_invalid_message
        puts "Invaid input!"
    end

    def show_menu_for_user
        puts "What do you want to do?:
        1. View balance
        2. Add balance
        3. Withrawl money"
    end

    def get_deposit
        puts "Enter the amount money you want to deposit"
        deposit = gets.chomp.to_i
        return deposit
    end

end



include Utilities
include Prompt

$account

class Account
    @@id = 0
    attr_accessor :name, :balance, :ssn

    def initialize(name, balance, ssn)
        self.name = name
        self.balance = balance
        self.ssn = ssn
        @@id += 1
    end

    def withrawl_money
    end

    def add_balance(deposit)
        valid = Utilities.validate_balance(deposit)
        if !valid
            Prompt.show_invalid_message
            return
        end
        self.balance += deposit
    end

    def view_info
        puts "Name: #{self.name}, Balance: #{self.balance}, SSN: #{self.ssn}"
    end

end

def create_account(name, balance, ssn)
    valid_balance = Utilities.validate_balance(balance)
    valid_ssn = Utilities.validate_ssn(ssn)
    if !valid_balance || !valid_ssn
        Prompt.show_invalid_message
        return
    end
    $account = Account.new(name, balance, ssn)
    puts "New account is created! >> #{$account.view_info}"
end


def execute_option_for_new_user(option)
    case option
        when 'y'
            info = Prompt.get_new_account_info
            create_account(info[:name],info[:balance], info[:ssn])    
        else 
            Prompt.show_invalid_message
    end
end
def execute_option_for_user(option)
    case option
        when '1'
            puts "You have $#{$account.balance} in your account."
        when '2'
            deposit = Prompt.get_deposit
            $account.add_balance(deposit)
            puts "Success. You have $#{$account.balance} in your account."
        when '3'   
            puts "chose 3 - withdrawl"
        else 
            Prompt.show_invalid_message
    end
end

Prompt.show_start_message

option = gets.chomp.downcase
execute_option_for_new_user(option)

Prompt.show_menu_for_user
bank_menu = gets.chomp[0,1]
execute_option_for_user(bank_menu)
