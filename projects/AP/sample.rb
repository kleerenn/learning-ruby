# sample


 #Feature 1:
 #This feature will allow user to either sign up for an account.
 #Or log in with their last name,last 4 digits of their social security number, and password.        

 module BankFunction

    def self.prompt_commands
        puts "What would you like to do:"
        puts " - Deposit"
        puts " - Withdrawal"
        puts " - Transfer"
        print "Please enter from options above:"
    end

    #method to validate user option command
    def self.validate_options(user_input_command)
            case user_input_command
            when "deposit"
                return true
            else
                prompt_commands
            end
    end

    def self.deposit_function(user_accounts, ssn)
        puts "Ok you will like to deposit"
        print "Please enter how much you will like to deposit:"
        user_deposit_input = gets.chomp
        
        #Find the user's account and add the deposit amount to their balance
        user_accounts.each do |users|
            if users[:ssn][-4..-1] == ssn
                users[:balance] = user_deposit_input
            end
        end
        print "User Balance #{user_accounts}"
    end

 end


#class for log in and sign up method
class Account

    #insert Module BankFunction into class
    include BankFunction

    USER_INFO=[
        {first: 'andy', last: 'park', password: 'hello123', ssn: '123456789', balance:20},
        {first: 'Jason', last: 'kim', password: 'bye123', ssn: '135791098', balance:10},
    ]

  #If attribute doesn't need to be edited after being initialized, only use reader
    attr_reader :last_name, :password, :ssn

    def initialize(first_name,last_name, password, ssn)
        @first_name = first_name
        @last_name = last_name
        @password = password
        @ssn = ssn
    end

    #Method to check if the users credential exist in the USER_INFO array of objects
    def validate_log_in_credentials
        user_found = USER_INFO.find {|user| user[:last].to_s == @last_name && user[:password] == @password && user[:ssn][-4..-1] == @ssn}
        if user_found 
            puts "Welcome back #{user_found[:first]} #{user_found[:last]}!"
            BankFunction.prompt_commands
            user_function_decision = gets.chomp.downcase

            if BankFunction.validate_options(user_function_decision)
                BankFunction.deposit_function(USER_INFO, @ssn)
            end
            
        else
          puts "Access Denied!"
          new_or_existing_user('y')
        end
    end

    #Method to push new user information into USER_INFO array of objects
    def add_new_user
        USER_INFO.push({first: @first_name, last: @last_name, password: @password, ssn: @ssn})
        print "Welcome #{@first_name} #{@last_name} to Bank of Invoca!"
    end


end


#############################################
######### Main program starts here!##########
#############################################
puts "Welcome to Bank of Invoca!"
print "Are you an existing user?(Y/N):"
existing_new_user = gets.chomp.downcase

def self.new_or_existing_user(user_response)
    case user_response
    when 'y'
        #Ask for credentials that will be used to validate sign in

        print "Please enter your last name:"
        user_last_name_input = gets.chomp.downcase

        print "Please enter your password:"
        user_password_input = gets.chomp.downcase

        print "Please enter the last 4 digits of your SSN:"
        user_ssn_input = gets.chomp.downcase

        instance_for_log = Account.new(nil,user_last_name_input, user_password_input, user_ssn_input)
        instance_for_log.validate_log_in_credentials
    when 'n'
        print "Please enter your first name:"
        user_first_name_input = gets.chomp
        print "Please enter your last name:"
        user_last_name_input = gets.chomp
        print "Please enter your password:"
        user_password_input = gets.chomp
        print "Please enter your 8 digit SSN number:"
        user_ssn_input = gets.chomp

        ##Check to see if user_ssn_input is 8 digits
        while user_ssn_input.length.to_i <8
            print "Please re-enter your 8 digit SSN:"
            user_ssn_input= gets.chomp
        end 

        ##If user_ssn_input is 8 digits, call add_new_user method from Account instance
        instance_new_user= Account.new(user_first_name_input, user_last_name_input, user_password_input, user_ssn_input)
        instance_new_user.add_new_user

    else
        print "Please re-enter Y or N:"
        $existing_new_user = gets.chomp.downcase
        new_or_existing_user($existing_new_user)
    end
end 




new_or_existing_user(existing_new_user) 

