require_relative 'crud' # when it's in the same directory
# require 'crud' # have to add $LOAD_PATH to indicate the current directory

users = [
  { username: 'karen', password: 'password1' },
  { username: 'aaron', password: 'password2' },
  { username: 'joe', password: 'password3' },
  { username: 'bom', password: 'password4' }
]

new_users = Crud.create_secure_users(users)
puts new_users
