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
        if balance.to_i < 0 || balance.is_a?(String) 
            puts "it's less than 0 or string!!!!!"
            valid = false
        end
    end

    def validate_ssn(ssn)
        puts ssn
        valid = true
        if ssn.to_s != 4 || ssn.is_a?(String)
            puts "wrong ssn"
            valid = false
        end
    end

end

module Prompt
    def show_start_message
        puts "Hello, Would you like to create an account? (Y/n)"
    end

    def get_new_account_info
        puts "Enter your name: "
        name = gets.chomp

        puts "Enter amount of money for initial deposit:"
        balance = gets.chomp

        puts "Enter the last 4 digit of SSN:"
        ssn = gets.chomp

        return { name: name, balance: balance, ssn: ssn }
    end
end



include Utilities
include Prompt

$accounts = []
class Account
    @@id = 0

    def initialize(name, balance, ssn)
        @name = name
        @balance = balance
        @ssn = ssn
        @@id += 1
    end

    def view_account
    end

    def add_balance
    end

    def transfer_money
    end

    def withrawl_money
    end

    def add_users
    end

    def create_account
    end

end

def create_account(name, balance, ssn)
    puts "Your input is #{name}, #{balance}, #{ssn}"

    valid_balance = Utilities.validate_balance(balance)
    valid_ssn = Utilities.validate_ssn(ssn)
   
    if !valid_balance || !valid_ssn
        puts "Invalid input - can't create an account."
    end

    account = Account.new(name, balance, ssn)
    # $account.push(account)
end


def execute_option(option)
    
    case option
        when 'y'
            info = Prompt.get_new_account_info
            puts info
            create_account(info[:name],info[:balance], info[:ssn])    
        else 
            puts "Not a valid answer"
    end
end




#####

Prompt.show_start_message
option = gets.chomp.downcase
execute_option(option)
