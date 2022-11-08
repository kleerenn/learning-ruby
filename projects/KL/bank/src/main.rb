require '../modules/Prompt.rb'
require '../modules/Utilities.rb'
require '../modules/Executor.rb'
require '../classes/Account.rb'

include Utilities
include Prompt
include Executor

$accounts = []
$account

# TODO: Find a better place for this
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

# Start here
Prompt.show_start_message

option = gets.chomp.downcase
Executor.option_for_new_user(option)

loop do
    Prompt.show_menu_for_user
    bank_menu = gets.chomp[0,1].downcase
    if bank_menu === 'q'
        break
    end
		Executor.option_for_user(bank_menu)
end