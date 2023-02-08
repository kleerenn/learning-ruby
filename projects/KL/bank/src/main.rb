# frozen_string_literal: true

require '../modules/prompt'
require '../modules/utilities'
require '../modules/executor'
require '../classes/account'

include utilities
include prompt
include executor

$accounts = []
$account

# TODO: Find a better place for this
def create_account(name, balance, ssn)
  valid_balance = utilities.validate_balance(balance)
  valid_ssn = utilities.validate_ssn(ssn)
  if !valid_balance || !valid_ssn
    prompt.show_invalid_message
    return
  end
  $account = account.new(name, balance, ssn)
  $account.view_info
end

# Start here
prompt.show_start_message

option = gets.chomp.downcase
executor.option_for_new_user(option)

loop do
  prompt.show_menu_for_user
  bank_menu = gets.chomp[0, 1].downcase
  break if bank_menu == 'q'

  executor.option_for_user(bank_menu)
end
