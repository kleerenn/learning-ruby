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


# Variables
$users = [1111]
$is_exisiting = false
$ssn
$accounts = []
$account_id = 0


# Methods
def show_start_message
    puts "Hello, please enter the last 4 digits of your social security number\n
        >> Numbers: "
end

def check_exising_user(number)
    $is_exisiting = $users.include?(number)
end

def show_options_for_exisiting_user
    puts "Welcome back, what would you like to do? Choose an options: \n
        1. View my account
        2. Add deposit
        3. Transfer Money
        4. Withdrawl mondy
        5. Add users to my account"
end

def show_optopns_for_new_user
    puts "User is not found. Would you like to create an account? Y / N"
end

def view_account
end

def add_deposit
end

def transfer_money
end

def withrawl_money
end

def add_users
end

def create_account(name, deposit)
    puts "will create account #{name}, #{deposit}, #{$ssn}"
    $accounts.push({
        id: $account_id,
        name: name,
        deposit: deposit,
        ssn: $ssn,
    })
    $account_id += 1
    puts $accounts
end

def show_menu_for_existing_user(option)
    case option
        when '1'
            puts "1 "
        when '2'
            puts "2"
        when '3'
            puts "3"
        when '4'
            puts "4"
        when '5'
            puts "5"
        else 
            puts " byy"
    end
end

def show_menu_for_new_user(option)
    case option
        when 'y'
            puts "Enter your name: "
            name = gets.chomp
            puts "Enter amount of money for initial deposit"
            deposit = gets.chomp
            if deposit < 0
                puts "Deposit can't be lower than 0. Please enter again: "
            end
            create_account(name, deposit)    
        else 
            puts "Not a valid answer"
    end
end




#####

show_start_message
$ssn = gets.chomp.to_i

check_exising_user($ssn)

if $is_exisiting
    show_options_for_exisiting_user
else 
   show_optopns_for_new_user
end

option = gets.chomp



if $is_exisiting
    show_menu_for_existing_user(option)
else
    show_menu_for_new_user(option.downcase)
end

