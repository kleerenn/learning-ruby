module Crud
  require 'bcrypt'

  def self.create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  # self. called class methods: does not require the instance of an object to make this method works.
  # just directing call it just by calling the name of the module when using this module.

  def self.verify_has_digest(password)
    BCrypt::Password.new(password)
  end

  def self.create_secure_users(list)
    list.each do |user|
      user[:password] = create_hash_digest(user[:password])
    end
    list
  end

  def self.authenticate_user(username, _password, list)
    list.each do |user|
      return user if user[:username] == username && verify_has_digest(user[:password])
    end
    'credential were not correct.'
  end

  # puts authenticate_user('karen', 'password1', new_users)
end
