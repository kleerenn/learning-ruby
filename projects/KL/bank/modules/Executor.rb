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

  # Metrics/AbcSize: Assignment Branch Condition size for option_for_user is too high. [<2, 20, 3> 20.32/17]
  def option_for_user(option)
    unless %w[1 2 3].include?(option)
      prompt.show_invalid_message
      return
    end
    case option
    when '2'
      deposit = prompt.enter_deposit
      $account.add_balance(deposit)
    when '3'
      deposit = prompt.enter_deposit
      $account.withdrawl_balance(deposit)
    end
    puts prompt.show_remaining_balance($account.balance)
  end
end
