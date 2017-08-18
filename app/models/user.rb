require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :username, :email, :password_hash, presence: true
  validates :username, :email, uniqueness: true

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id
  has_many :comments, foreign_key: :author_id

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = self.find_by(email: email)
    if user && user.password == password
      return user
    else
      return nil
    end
  end

end
