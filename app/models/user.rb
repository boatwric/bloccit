#Defines what a User is
#http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html; ""callbacks are hooks into the life cycle of an Active Record object that allow you to trigger logic before or after an alteration of the object state.""
#http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
#has_secure_password requires BCrypt module installation (https://rubygems.org/gems/bcrypt-ruby/versions/3.1.5); takes a plain text password and turns it into an unrecognizable string of characters using a hashing algorithm such as MD5

class User < ApplicationRecord
  #before_save callback followed by inline callback; assigns User.email a downcased version after it checks if anything was input
  before_save { self.email = email.downcase if email.present? }

  #checks for name between 1 and 100 characters
  validates :name,
    length: { minimum: 1, maximum: 100 },
    presence: true

  #executes if password_digest is nil; ensures that when we create a new user, they have a valid password
  validates :password,
    presence: true,
    length: { minimum: 6 },
    if: "password_digest.nil?"

  #ensures that when updating a user's password, the updated password is also six characters long; allow_blank: true skips the validation if no updated password is given; allows us to change other attributes on a user without being forced to set password
  validates :password,
    length: { minimum: 6 },
    allow_blank: true

  #checks that value is entered, not case sensitive, length between 3 and 254 characters
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 254 }

  #abstracts away much of the complexity of obfuscating user passwords using hashing algorithms which we would otherwise be inclined to write to securely save passwords; see documentation at top
  has_secure_password

end
