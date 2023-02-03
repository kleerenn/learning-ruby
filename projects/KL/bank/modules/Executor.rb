module Executor
  def option_for_new_user(option)
    case option
    when 'y'
      info = Prompt.new_account_info
      create_account(info[:name], info[:balance], info[:ssn])
    else
      Prompt.show_invalid_message
    end
  end

  def option_for_user(option)
    case option
    when '1'
      puts Prompt.show_remaining_balance($account.balance)
    when '2'
      deposit = Prompt.enter_deposit
      $account.add_balance(deposit)
      puts Prompt.show_remaining_balance($account.balance)
    when '3'
      deposit = Prompt.enter_deposit
      $account.withdrawl_balance(deposit)
      puts Prompt.show_remaining_balance($account.balance)
    else
      Prompt.show_invalid_message
    end
  end
end
