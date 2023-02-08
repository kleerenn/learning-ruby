# frozen_string_literal: true

# Service to execute function upon user's input

module Executor
  def option_for_new_user(option)
    case option
    when 'y'
      info = prompt.new_account_info
      create_account(info[:name], info[:balance], info[:ssn])
    else
      prompt.show_invalid_message
    end
  end

  def option_for_user(option)
    case option
    when '1'
      puts prompt.show_remaining_balance($account.balance)
    when '2'
      deposit = prompt.enter_deposit
      $account.add_balance(deposit)
      puts prompt.show_remaining_balance($account.balance)
    when '3'
      deposit = prompt.enter_deposit
      $account.withdrawl_balance(deposit)
      puts prompt.show_remaining_balance($account.balance)
    else
      prompt.show_invalid_message
    end
  end
end
