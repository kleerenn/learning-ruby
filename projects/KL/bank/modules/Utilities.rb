module Utilities
    def validate_balance(balance)
        valid = true
        if balance < 0 
            puts "it's less than 0 or string!!!!!"
            valid = false
        end
        valid
    end

    def validate_ssn(ssn)
        # TODO: reg pattern
        valid = true
        digits = Math.log10(ssn).to_i + 1
        if digits != 10
            valid = false
        end
        valid
    end

end