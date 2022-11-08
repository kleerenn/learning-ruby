require '../modules/Prompt.rb'
require '../modules/Utilities.rb'
require '../classes/Account.rb'

include Utilities
include Prompt

$accounts = []
$account

def create_account(name, balance, ssn)
    valid_balance = Utilities.validate_balance(balance)
    valid_ssn = Utilities.validate_ssn(ssn)
    if !valid_balance || !valid_ssn
        Prompt.show_invalid_message
        return
    end
    $account = Account.new(name, balance, ssn)
    $account.view_info
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
            puts Prompt.show_remaining_balance($account.balance)
        when '2'
            deposit = Prompt.get_deposit
            $account.add_balance(deposit)
            puts Prompt.show_remaining_balance($account.balance)
        when '3'  
            deposit = Prompt.get_deposit
            $account.withdrawl_balance(deposit)
            puts Prompt.show_remaining_balance($account.balance) 
        else 
            Prompt.show_invalid_message
    end
end


# Start here
Prompt.show_start_message

option = gets.chomp.downcase
execute_option_for_new_user(option)

loop do
    Prompt.show_menu_for_user
    bank_menu = gets.chomp[0,1].downcase
    if bank_menu === 'q'
        break
    end
    execute_option_for_user(bank_menu)
end