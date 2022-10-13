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

my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

# Add your code below!
symbol_filter = lambda {|a| a.is_a? Symbol }

symbols = my_array.select(&symbol_filter)

puts symbols