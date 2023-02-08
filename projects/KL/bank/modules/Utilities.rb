# frozen_string_literal: true

# Reusable functions

module Utilities
  def validate_balance(balance)
    valid = true
    if balance.negative?
      puts 'Less than 0 or string.'
      valid = false
    end
    valid
  end

  def validate_ssn(ssn)
    # TODO: reg pattern
    valid = true
    digits = Math.log10(ssn).to_i + 1
    valid = false if digits != 10
    valid
  end
end
