# Homework - String
puts 'Enter your first name'
first_name = gets.chomp

puts 'enter your last name'
last_name = gets.chomp

full_name = first_name + ' ' + last_name
reversed_name = full_name.reverse
character_count = full_name.length

puts "Your fill name is #{full_name}."
puts "Your full name reversed is #{reversed_name}."
puts "Your name has #{character_count - 1} in it."

# Homework - Number
puts 'Enter the first number'
num_1 = gets.chomp

puts 'Enter the second number'
num_2 = gets.chomp

def multiply(a, b)
  a.to_i * b.to_i
end

def divide(a, b)
  a.to_i / b.to_i
end

def add(a, b)
  a.to_i + b.to_i
end

def subtract(a, b)
  a.to_i - b.to_i
end

def mod(a, b)
  a.to_i % b.to_i
end

puts 'Enter 1 for multiply, 2 for addition, 3 for subtraction.'
user_entry = gets.chomp

if user_entry == '1'
  puts "The first number multiplied by the second number is #{multiply(num_1, num_2)}}"
elsif user_entry == '2'
	puts "The first number added to the second number is #{add(num_1, num_2)}}"
elsif user_entry == '3'
	puts "The first number subtracted from the second number is #{subtract(num_1, num_2)}"
end

# puts "The first number multiplied by the second number is #{multiply(num_1, num_2)}}"
# puts "The first number dvided by the second number is #{divide(num_1, num_2)}"
# puts "The first number added to the second number is #{add(num_1, num_2)}}"
# puts "The first number subtracted from the second number is #{subtract(num_1, num_2)}"
# puts "The first number mod the second number is #{mod(num_1, num_2)}}"

modulus
