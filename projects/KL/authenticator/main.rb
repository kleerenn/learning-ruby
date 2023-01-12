users = [
  { username: 'karen', password: 'password1' },
  { username: 'aaron', password: 'password2' },
  { username: 'joe', password: 'password3' },
  { username: 'bom', password: 'password4' }
]

puts 'Welcome to the authenticator'
25.times { print '-' }
puts
puts 'This program will take input from the use and compare password'
puts 'If password is correct, you will get back the user object'

def authenticate(username, password, list)
  list.each do |user|
    return user if user[:username] == username && user[:password] == password
  end
  'Incorrect'
end

attempts = 1
while attempts < 4
  puts 'Username: '
  username = gets.chomp

  puts 'Password: '
  password = gets.chomp

  result = authenticate(username, password, users)
  puts result

  puts 'Press n to exit or any key to continue'
  input = gets.chomp.downcase
  break if input == 'n'

  attempts += 1
end

puts "You have exceeded the maximum attempts #{attempts - 1}"
